package com.zz.chatroom.service;

import javax.servlet.http.HttpSession;

import com.zz.chatroom.util.ResponseJson;

public interface SecurityService {

    ResponseJson login(HttpSession session,String userName,String userPassword);
    
    ResponseJson logout(HttpSession session);
}
