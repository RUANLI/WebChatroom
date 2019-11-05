package com.zz.chatroom.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zz.chatroom.bean.MessagesBean;


import java.util.List;

/**
* @author      : RuanLI
* @version     : 1.0
* @serial      : 使用 MAKECODE SSM 生成
* @description : 好友消息
* @date        : 2019-10-23 19:31:47
*/
public interface MessagesDao extends BaseMapper<MessagesBean> {

    List<MessagesBean> getMessagesList(MessagesBean entity);

    List<MessagesBean> offlineMessageList(MessagesBean entity);
 }
