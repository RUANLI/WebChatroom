package com.zz.chatroom.service;

import com.zz.chatroom.util.ResponseJson;


public interface UserInfoService {

    ResponseJson getByUserId(Integer userId);

}
