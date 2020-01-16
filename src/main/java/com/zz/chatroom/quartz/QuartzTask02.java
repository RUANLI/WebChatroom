package com.zz.chatroom.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author : RUAN.LI
 * @version : 1.0
 * @description :
 * @date : 2019/10/15
 */
public class QuartzTask02 extends QuartzJobBean {

    private String name;

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    //定时任务业务逻辑写在以下方法中
    @Override
    protected void executeInternal(JobExecutionContext arg0)
            throws JobExecutionException {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(name + " 每次晨练时间===========" +simpleDateFormat.format(date));
    }
}
