package com.zz.chatroom.web.controller;


import javax.servlet.http.HttpSession;

import com.zz.chatroom.service.UserInfoService;
import com.zz.chatroom.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zz.chatroom.util.ResponseJson;
/**
 * 用户信息
 */
@Controller
@RequestMapping("/chatroom")
public class ChatroomController {

    @Autowired
    UserInfoService userInfoService;
    
    /**
     * 描述：登录成功后，调用此接口进行页面跳转
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String toChatroom() {
        return "chatroom";
    }
    
    /**
     * 描述：登录成功跳转页面后，调用此接口获取用户信息
     * @param userid
     * @return
     */
    @RequestMapping("/get_userinfo")
    @ResponseBody
    public ResponseJson getUserInfo(HttpSession session) {
        Object userId = session.getAttribute(Constant.USER_TOKEN);
        return userInfoService.getByUserId((Integer)userId);
    }
}
