package com.zz.chatroom.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zz.chatroom.bean.UserInfoBean;
import java.util.List;

/**
 * @author : RuanLI
 * @version : 1.0
 * @serial : 使用 MAKECODE SSM 生成
 * @description : 用户
 * @date : 2019-10-23 19:36:11
 */
public interface UserInfoDao extends BaseMapper<UserInfoBean> {


    UserInfoBean getSysUserLogin(UserInfoBean entity);

    List<UserInfoBean> loadUserInfo();

    List<UserInfoBean> queryFriends(Integer userId);

}
