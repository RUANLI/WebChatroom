package com.zz.chatroom.web.websocket;

import io.netty.channel.ChannelPipeline;
import io.netty.handler.timeout.IdleStateHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.stream.ChunkedWriteHandler;

import java.util.concurrent.TimeUnit;

/**
 * @author Administrator
 */
@Component
public class WebSocketChildChannelHandler extends ChannelInitializer<SocketChannel> {
    @Autowired()
    @Qualifier("webSocketServerHandler")
    private ChannelHandler webSocketServerHandler;

    @Autowired()
    @Qualifier("httpRequestHandler")
    private ChannelHandler httpRequestHandler;

    /**
     * Inbound 执行顺序，由上到下。Outbound执行顺序由下道上，
     */
    @Override
    protected void initChannel(SocketChannel ch) throws Exception {
        ChannelPipeline pipeline = ch.pipeline();
        pipeline
                //心跳检测 10秒无任何响应就断开
                .addLast(new IdleStateHandler(40, 40, 0, TimeUnit.SECONDS))
                // HTTP编码解码器
                .addLast("http-codec", new HttpServerCodec())
                // 把HTTP头、HTTP体拼成完整的HTTP请求
                .addLast("aggregator", new HttpObjectAggregator(65536))
                // 方便大文件传输，不过实质上都是短的文本数据 主要针对SSL加密解密。
                .addLast("http-chunked", new ChunkedWriteHandler())
                .addLast("http-handler", httpRequestHandler)
                .addLast("websocket-handler", webSocketServerHandler);
    }

}
