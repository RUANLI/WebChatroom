package com.zz.chatroom.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zz.chatroom.bean.GroupInfoBean;
import com.zz.chatroom.bean.UserInfoBean;
import com.zz.chatroom.dao.GroupInfoDao;
import com.zz.chatroom.dao.UserInfoDao;
import com.zz.chatroom.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import com.zz.chatroom.util.ResponseJson;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoDao userInfoDao;
    @Autowired
    private GroupInfoDao groupInfoDao;

    /**
     * userId：用户Id
     * 根据用户ID返回个人信息
     */
    @Override
    public ResponseJson getByUserId(Integer userId) {
        UserInfoBean userInfo = userInfoDao.selectById(userId);
        //获取朋友
        List<UserInfoBean> friends = userInfoDao.queryFriends(userId);
        QueryWrapper<GroupInfoBean> ew = new QueryWrapper<>();
        //获取群
        List<GroupInfoBean> groups = groupInfoDao.selectList(ew);
        userInfo.setFridents(friends);
        userInfo.setGroups(groups);
        return new ResponseJson().success().setData("userInfo", userInfo);
    }
}
