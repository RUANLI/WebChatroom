package com.zz.chatroom.util;

public enum ChatType {

    REGISTER,//注册
    SINGLE_SENDING,//消息发送
    GROUP_SENDING,//群消息发送
    FILE_MSG_SINGLE_SENDING,//文件发送
    FILE_MSG_GROUP_SENDING,//群文件发送
    OFFLINE_MESSAGE,//离线消息
    OFFLINE_FILE,//离线文件
    CHAT_NOTES,//消息记录
    HEART_BEAT,//心跳包
    SERVICE_OFFLINE;//服务器正常断线

}
