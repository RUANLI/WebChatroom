package com.zz.chatroom.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 * @author : RuanLI
 * @version : 1.0
 * @serial : 使用 MAKECODE SSM 生成
 * @description :用户表
 * @date : 2019-10-23 19:36:11
 */
@TableName("USER_INFO")
public class UserInfoBean implements Serializable {

    /**
     * ID
     */
    @TableId(value = "USER_ID")
    private Integer userId;

    /**
     * 用户名
     */
    @TableField(value = "USER_NAME")
    private String userName;

    /**
     * 用户密码
     */
    @TableField(value = "USER_PASSWORD")
    private String userPassword;

    /**
     * 用户头像
     */
    @TableField(value = "USER_ICON")
    private String userIcon;

    /**
     * 离线时间
     */
    @TableField(value = "USER_OFFLINE_TIME")
    private Date userOfflineTime;
    /**
     * 好友列表
     */
    @TableField(exist = false)
    private List<UserInfoBean> fridents;
    /**
     * 群列表
     */
    @TableField(exist = false)
    private List<GroupInfoBean> groups;

    public Integer getUserId() { return userId; }

    public UserInfoBean setUserId(Integer userId) {
        this.userId = userId;
        return this;
    }

    public String getUserName() { return userName; }

    public UserInfoBean setUserName(String userName) { this.userName = userName; return this;}

    public String getUserPassword() { return userPassword; }

    public UserInfoBean setUserPassword(String userPassword) { this.userPassword = userPassword; return this;}

    public String getUserIcon() { return userIcon; }

    public UserInfoBean setUserIcon(String userIcon) { this.userIcon = userIcon; return this;}

    public Date getUserOfflineTime() {
        return userOfflineTime;
    }

    public UserInfoBean setUserOfflineTime(Date userOfflineTime) {
        this.userOfflineTime = userOfflineTime;
        return this;
    }

    public List<UserInfoBean> getFridents() {
        return fridents;
    }

    public void setFridents(List<UserInfoBean> fridents) {
        this.fridents = fridents;
    }

    public List<GroupInfoBean> getGroups() {
        return groups;
    }

    public void setGroups(List<GroupInfoBean> groups) {
        this.groups = groups;
    }
}
