package com.zz.chatroom.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.junit.Test;

import java.util.Date;
import java.io.Serializable;

/**
 * @author : RuanLI
 * @version : 1.0
 * @serial : 使用 MAKECODE SSM 生成
 * @date : 2019-10-23 19:31:47
 * @since : 消息表
 */
@TableName("MESSAGES")
public class MessagesBean implements Serializable {

    /**
     * 消息ID
     */
    @TableId(value = "M_ID",type = IdType.AUTO)
    private Long messageId;

    /**
     * 消息内容
     */
    @TableField(value = "M_CONTENT")
    private String content;
    /**
     * 发送时间
     */
        @TableField(value = "M_TIME")
    private Date userTime;

    /**
     * 发送者ID
     */
    @TableField(value = "M_FROM_USER_ID")
    private Integer fromUserId;

    /**
     * 接收者ID
     */
    @TableField(value = "M_TO_USER_ID")
    private Integer toUserId;

    /**
     * 消息类型
     */
    @TableField(value = "M_TYPE")
    private Integer type;

    /**
     * 文件路径
     */
    @TableField(value ="M_FILE_URL")
    private String  fileUrl;

    /**
     * 文件名称
     */
    @TableField(value ="M_FILE_NAME")
    private String  fileName;

    /**
     * 文件大小
     */
    @TableField(value ="M_FILE_SIZE")
    private String  fileSize;

    /**
     * 群ID
     */
    @TableField(value ="M_GID")
    private Integer  groupId;


    public Long getMessageId() {
        return messageId;
    }

    public MessagesBean setMessageId(Long messageId) {
        this.messageId = messageId;
        return this;
    }

    public String getContent() {
        return content;
    }

    public MessagesBean setContent(String content) {
        this.content = content;
        return this;
    }

    public Date getUserTime() {
        return userTime;
    }

    public MessagesBean setUserTime(Date userTime) {
        this.userTime = userTime;
        return this;
    }

    public Integer getFromUserId() {
        return fromUserId;
    }

    public MessagesBean setFromUserId(Integer fromUserId) {
        this.fromUserId =fromUserId;
        return this;
    }

    public Integer getToUserId() {
        return toUserId;
    }

    public MessagesBean setToUserId(Integer toUserId) {
        this.toUserId = toUserId;
        return this;
    }

    public Integer getType() {
        return type;
    }

    public MessagesBean setType(Integer type) {
        this.type = type;
        return this;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public MessagesBean setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
        return this;
    }

    public String getFileName() {
        return fileName;
    }

    public MessagesBean setFileName(String fileName) {
        this.fileName = fileName;
        return this;
    }

    public String getFileSize() {
        return fileSize;
    }

    public MessagesBean setFileSize(String fileSize) {
        this.fileSize = fileSize;
        return this;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public MessagesBean setGroupId(Integer groupId) {
        this.groupId = groupId;
        return this;
    }
}