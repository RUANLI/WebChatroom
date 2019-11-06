package com.zz.chatroom.service;

import com.alibaba.fastjson.JSONObject;
import com.zz.chatroom.util.ResponseJson;


public interface ChatNotesService {

    ResponseJson getChatNotes(JSONObject data);
}
