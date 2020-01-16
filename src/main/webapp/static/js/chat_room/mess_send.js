// 绑定发送按钮回车事件
$('#dope').keydown(function (e) {
    if (e.keyCode == 13) {
        $('.sendBtn').trigger('click');
        e.preventDefault(); //屏蔽enter对系统作用。按后增加\r\n等换行
    }
});

// 绑定发送按钮点击事件
$('.sendBtn').on('click', function () {
    var fromUserId = userId;
    var toUserId = $('#toUserId').val();
    var toGroupId = $('#toGroupId').val();
    var news = $('#dope').val();
    if (toUserId == '' && toGroupId == '') {
        $.DialogByZ.Alert({Title: "系统提示", Content: "请选择对话方", BtnL: "确定", FunL: alerts})
        return;
    }
    if (news == '') {
        $.DialogByZ.Alert({Title: "系统提示", Content: '消息不能为空', BtnL: "确定", FunL: alerts})
        return;
    } else {
        if (toUserId.length != 0) {
            ws.singleSend(fromUserId, toUserId, news);
        } else {
            ws.groupSend(fromUserId, toGroupId, news);
        }

        $('#dope').val('');
        var userIcon = $('#userIcon').attr("src");
        var msg = '';
        msg += '<li>' +
            '<div class="news">' + '<span style="color:#70FF3B;font-weight:bold">' + new Date().format("yyyy-MM-dd hh:mm:ss") + '</span>' + '</br>' + news + '</div>' +
            '<div class="nesHead"><img src="' + userIcon + '"/></div>' +
            '</li>';

        // 消息框处理：
        processMsgBox.sendMsg(msg, toUserId, toGroupId)

        // 好友列表处理：
        var $sendLi = $('.conLeft').find('li.bg');
        processFriendList.sending(news, $sendLi);
    }
})
