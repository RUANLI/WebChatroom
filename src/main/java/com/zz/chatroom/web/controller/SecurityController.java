package com.zz.chatroom.web.controller;

import javax.servlet.http.HttpSession;

import com.zz.chatroom.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zz.chatroom.util.ResponseJson;

/**
 * 登陆处理
 */
@Controller
public class SecurityController {

    @Autowired
    private SecurityService securityService;
    
    @RequestMapping(value = {"login", "/"}, method = RequestMethod.GET)
    public String toLogin() {
        return "login";
    }
    
    @RequestMapping("login")
    @ResponseBody
    public ResponseJson login(HttpSession session, String userName,String userPassword) {
        return securityService.login(session,userName,userPassword);
    }
    
    @RequestMapping("logout")
    @ResponseBody
    public ResponseJson logout(HttpSession session) {
        return securityService.logout(session);
    }
}
