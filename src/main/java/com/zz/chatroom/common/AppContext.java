package com.zz.chatroom.common;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.zz.chatroom.web.websocket.WebSocketServer;
import org.springframework.stereotype.Component;

@Component
@Scope("singleton")
public class AppContext {

    private final Logger logger = LoggerFactory.getLogger(AppContext.class);
    @Autowired
    private WebSocketServer webSocketServer;

    private Thread nettyThread;

    /**
     * 描述：Tomcat加载完ApplicationContext-main和netty文件后：
     * 1. 启动Netty WebSocket服务器；
     * 2. 加载用户数据；
     * 3. 加载用户交流群数据。
     * <p>
     * 被@PostConstruct修饰的方法会在服务器加载Servlet的时候运行，并且只会被服务器执行一次。
     *
     * @PostConstruct注解的方法将会在依赖注入完成后被自动调用。
     */
    @PostConstruct
    public void init() {
        nettyThread = new Thread(webSocketServer);
        logger.info("开启独立线程，启动Netty WebSocket服务器...");
        nettyThread.start();
    }

    /**
     * 描述：Tomcat服务器关闭前需要手动关闭Netty Websocket相关资源，否则会造成内存泄漏。
     * 1. 释放Netty Websocket相关连接；
     * 2. 关闭Netty Websocket服务器线程。（强行关闭，是否有必要？）
     * <p>
     * PreDestroy（）方法在destroy（）方法执行之后执行
     */
    @SuppressWarnings("deprecation")
    @PreDestroy
    public void close() {
        logger.info("正在释放Netty Websocket相关连接...");
        webSocketServer.close();
        logger.info("正在关闭Netty Websocket服务器线程...");
        nettyThread.stop();
        logger.info("系统成功关闭！");
    }
}
