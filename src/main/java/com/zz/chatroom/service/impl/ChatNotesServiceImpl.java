package com.zz.chatroom.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zz.chatroom.bean.MessagesBean;
import com.zz.chatroom.dao.MessagesDao;
import com.zz.chatroom.service.ChatNotesService;
import com.zz.chatroom.util.ResponseJson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : RUAN.LI
 * @version : 1.0
 * @description :
 * @date : 2019/11/5
 */
@Service
public class ChatNotesServiceImpl implements ChatNotesService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ChatNotesServiceImpl.class);

    // private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Autowired
    private MessagesDao messagesDao;

    @Override
    public ResponseJson getChatNotes(JSONObject data) {
        //消息集合
        List<MessagesBean> messagesInfos;
        QueryWrapper<MessagesBean> ew = new QueryWrapper<>();
        if (null == data.get("groupId") || "" == data.get("groupId")) {
            //发送人ID
            Integer fromUserId = (Integer) data.get("fromUserId");
            //接收者ID
            Integer toUserId = Integer.parseInt((String) data.get("toUserId"));
            ew.and(i -> i.eq("M_TO_USER_ID", toUserId).eq("M_FROM_USER_ID", fromUserId))
                    .or(i -> i.eq("M_TO_USER_ID", fromUserId).eq("M_FROM_USER_ID", toUserId))
                    .last("order By M_TIME Asc");
            //获取好友消息
            messagesInfos = messagesDao.selectList(ew);
        } else {
            //群ID
            Integer groupId = Integer.parseInt((String) data.get("groupId"));
            //获取群消息
            ew.eq("M_GID", groupId).last("order By M_TIME Asc");
            messagesInfos = messagesDao.selectList(ew);
        }
        return new ResponseJson().success().setData("messageInfos", messagesInfos);
    }
}
