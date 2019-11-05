package com.zz.chatroom.service.impl;

import java.text.MessageFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import com.zz.chatroom.bean.UserInfoBean;
import com.zz.chatroom.dao.UserInfoDao;
import com.zz.chatroom.service.SecurityService;
import com.zz.chatroom.util.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zz.chatroom.util.ResponseJson;

@Service
public class SecurityServiceImpl implements SecurityService {

    @Autowired
    private UserInfoDao userInfoDao;
    
    private static final Logger LOGGER = LoggerFactory.getLogger(SecurityServiceImpl.class);
    
    
    @Override
    public ResponseJson login( HttpSession session,String userName,String password) {
        UserInfoBean entity = new UserInfoBean();
        entity.setUserName(userName);
        entity.setUserPassword(password);
        UserInfoBean userInfo = userInfoDao.getSysUserLogin(entity);
        if (userInfo == null) {
            return new ResponseJson().error("用户名或密码不正确");
        }
        if (!userInfo.getUserPassword().equals(password)) {
          return new ResponseJson().error("密码不正确");
        }
        userInfoDao.updateById(userInfo);
        session.setAttribute(Constant.USER_TOKEN, userInfo.getUserId());
        return new ResponseJson().success();
    }

    @Override
    public ResponseJson logout(HttpSession session) {
        Object userId = session.getAttribute(Constant.USER_TOKEN);
        if (userId == null) {
            return new ResponseJson().error("请先登录！");
        }
        UserInfoBean userInfo = userInfoDao.selectById((Integer) userId);
        userInfo.setUserOfflineTime(new Date());
        userInfoDao.updateById(userInfo);
        session.removeAttribute(Constant.USER_TOKEN);

        LOGGER.info(MessageFormat.format("userId为 {0} 的用户已注销登录!", userId));
        return new ResponseJson().success();
    }

}
