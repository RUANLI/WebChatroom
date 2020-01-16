package com.zz.chatroom.web.websocket;

import com.zz.chatroom.util.ResponseJson;
import com.zz.chatroom.service.ChatService;
import com.zz.chatroom.util.Constant;
import io.netty.handler.codec.http.websocketx.*;
import io.netty.handler.timeout.IdleStateEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson.JSONObject;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.ChannelHandler.Sharable;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

@Component
@Sharable
public class WebSocketServerHandler extends SimpleChannelInboundHandler<WebSocketFrame> {

    private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketServerHandler.class);
    /**
     *  这里用来对连接数进行记数,每两秒输出到控制台
     *  AtomicInteger是一个提供原子操作的Integer类，通过线程安全的方式操作加减。
     *  AtomicInteger是在使用非阻塞算法实现并发控制，在一些高并发程序中非常适合，
     */

    private static final AtomicInteger nConnection = new AtomicInteger();

    @Autowired
    private ChatService chatService;
    private static SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    static {
        Executors.newSingleThreadScheduledExecutor().scheduleAtFixedRate(() -> {
            System.out.println("当前websocket连接数: " + nConnection.get()+"当前时间"+ SDF.format(new Date()));
        }, 0, 10, TimeUnit.SECONDS);
    }

//
//    // 失败计数器：未收到client端发送的ping请求
//    private int unRecPingTimes = 0;
//    // 定义服务端没有收到心跳消息的最大次数
//    private static final int MAX_UN_REC_PING_TIMES = 3;

    /**
     * 描述：读取完连接的消息后，对消息进行处理。
     * 这里主要是处理WebSocket请求
     */
    @Override
    protected void channelRead0(ChannelHandlerContext ctx, WebSocketFrame frame) throws Exception {
        handlerWebSocketFrame(ctx, frame);
    }

    /**
     * 描述：处理WebSocketFrame
     *
     * @param ctx
     * @param frame
     * @throws Exception
     */
    private void handlerWebSocketFrame(ChannelHandlerContext ctx, WebSocketFrame frame) throws Exception {
        // 关闭请求
        if (frame instanceof CloseWebSocketFrame) {
            WebSocketServerHandshaker handshaker =
                    Constant.webSocketHandshakerMap.get(ctx.channel().id().asLongText());
            if (handshaker == null) {
                sendErrorMessage(ctx, "不存在的客户端连接！");
            } else {
                handshaker.close(ctx.channel(), (CloseWebSocketFrame) frame.retain());
            }
            return;
        }
        // ping请求
        if (frame instanceof PingWebSocketFrame) {
            ctx.channel().write(new PongWebSocketFrame(frame.content().retain()));
            return;
        }
        // 只支持文本格式，不支持二进制消息
        if (!(frame instanceof TextWebSocketFrame)) {
            sendErrorMessage(ctx, "仅支持文本(Text)格式，不支持二进制消息");
        }

        // 客服端发送过来的消息
        String request = ((TextWebSocketFrame) frame).text();
        LOGGER.info("服务端收到新信息：" + request);
        JSONObject param = null;
//        Message message = new Message();
//        String jsonString = JSONObject.toJSONString(message);
        try {
            param = JSONObject.parseObject(request);
    /*        param = JSONObject.parseObject(jsonString);*/
        } catch (Exception e) {
            sendErrorMessage(ctx, "JSON字符串转换出错！");
            e.printStackTrace();
        }
        if (param == null) {
            sendErrorMessage(ctx, "参数为空！");
            return;
        }
        String type = param.get("type").toString();
        switch (type) {
            case "REGISTER":
                chatService.register(param, ctx);
                //离线消息
                chatService.offlineMessage(param, ctx);
                break;
            case "HEART_CLIENT":
//                chatService.heartBeat();
                break;
            case "SINGLE_SENDING":
                chatService.singleSend(param, ctx);
                break;
            case "GROUP_SENDING":
                chatService.groupSend(param, ctx);
                break;
            case "FILE_MSG_SINGLE_SENDING":
                chatService.fileMsgSingleSend(param, ctx);
                break;
            case "FILE_MSG_GROUP_SENDING":
                chatService.fileMsgGroupSend(param, ctx);
                break;
            default:
                chatService.typeError(ctx);
                break;
        }
    }

    /**
     * 超时处理，如果1分钟没有收到客户端的心跳，就触发; 如果超过3次，则直接关闭;
     */
    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object msg) throws Exception {
        IdleStateEvent event = (IdleStateEvent) msg;
        switch (event.state()) {//具体业务逻辑具体分析
            case READER_IDLE:
                LOGGER.info("已经40秒还没收到客户端发来的心跳，断开连接");
                chatService.remove(ctx);
                ctx.close();
                break;
            case WRITER_IDLE:
                LOGGER.info("该客户端已经40秒很久没收到消息了，断开连接");
                chatService.remove(ctx);
                ctx.channel().close();
                break;
            case ALL_IDLE:
                LOGGER.info("该客户端很久没有读写了，断开连接");
                chatService.remove(ctx);
                ctx.close();
                break;
            default:
                LOGGER.info("异常！");

        }
    }

    /**
     * 描述：客户端断开连接（网络异常等非正常下线则无法感知）
     */
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        nConnection.decrementAndGet();
        chatService.remove(ctx);
    }
    /**
     * 描述：客户端连接
     */
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        nConnection.incrementAndGet();
    }

    /**
     * 异常处理：关闭channel
     */
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        cause.printStackTrace();
        ctx.close();
    }

    private void sendErrorMessage(ChannelHandlerContext ctx, String errorMsg) {
        String responseJson = new ResponseJson()
                .error(errorMsg)
                .toString();
        ctx.channel().writeAndFlush(new TextWebSocketFrame(responseJson));
    }
    private class Message {
        public String data = "ping";
        public String type = "HEART_BEAT";
        public String thread = Thread.currentThread().getName();
    }
}

