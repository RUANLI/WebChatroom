package com.zz.chatroom.quartz;

import com.zz.chatroom.service.ChatService;
import com.zz.chatroom.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author : RUAN.LI
 * @version : 1.0
 * @description :
 * @date : 2019/10/15
 */
//编写一个定时执行业务逻辑的类
public class QuartzTask01 {
    @Autowired
    private ChatService chatService;
    public void run (){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        chatService.heartBeat();

    }
}
