package com.zz.chatroom.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.zz.chatroom.bean.MessagesBean;
import com.zz.chatroom.service.ChatNotesService;
import com.zz.chatroom.service.UserInfoService;
import com.zz.chatroom.util.ResponseJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author : RUAN.LI
 * @version : 1.0
 * @description :聊天记录
 * @date : 2019/11/5
 */
@Controller
@RequestMapping("/chatroom")
public class ChatNotesController {

    @Autowired
    private ChatNotesService chatNotesService;

    @RequestMapping(value = "/get_chatNotes",consumes ="application/json")
    @ResponseBody
    public ResponseJson getChatNotes(@RequestBody JSONObject data) {
        System.out.println(data);
        return chatNotesService.getChatNotes(data);
    }
}





