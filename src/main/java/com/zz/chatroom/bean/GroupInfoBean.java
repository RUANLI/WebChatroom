package com.zz.chatroom.bean;

import java.util.Date;
import java.io.Serializable;
import java.util.List;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 * @author : RuanLI
 * @version : 1.0
 * @serial : 使用 MAKECODE SSM 生成
 * @description :群用户
 * @date : 2019-10-23 19:38:39
 */
@TableName("GROUP_INFO")
public class GroupInfoBean implements Serializable {

    /**
     * 群id
     */
    @TableId(value = "UG_ID")
    private Integer groupId;

    /**
     * 群名
     */
    @TableField(value = "UG_GROUP_NAME")
    private String groupName;

    /**
     * 用户ID
     */
    @TableField(value = "UG_USER_ID")
    private Integer userId;

    /**
     * 加群时间
     */
    @TableField(value = "UG_CREATE_TIME")
    private Date groupCreateTime;
    /**
     *群头像
     */
    @TableField(value = "UG_ICON")
    private String groupIcon;
    /**
     * 群成员
     */
    @TableField(exist = false)
    private List<UserInfoBean> members;

    public Integer getGroupId() {
        return groupId;
    }

    public GroupInfoBean setGroupId(Integer groupId) {
        this.groupId = groupId;return this;
    }

    public String getGroupName() {
        return groupName;
    }

    public GroupInfoBean setGroupName(String groupName) {
        this.groupName = groupName;return this;
    }

    public Integer getUserId() {
        return userId;
    }

    public GroupInfoBean setUserId(Integer userId) {
        this.userId = userId;return this;
    }

    public String getGroupIcon() { return groupIcon; }

    public GroupInfoBean setGroupIcon(String groupIcon) { this.groupIcon = groupIcon; return this;}

    public Date getGroupCreateTime() {
        return groupCreateTime;
    }

    public GroupInfoBean setGroupCreateTime(Date groupCreateTime) {
        this.groupCreateTime = groupCreateTime;return this;
    }

    public List<UserInfoBean> getMembers() {
        return members;
    }

    public void setMembers(List<UserInfoBean> members) {
        this.members = members;
    }
}
