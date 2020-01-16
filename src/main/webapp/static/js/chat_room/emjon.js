$('.ExP').on('mouseenter', function () {
    $('.emjon').show();
})

$('.emjon').on('mouseleave', function () {
    $('.emjon').hide();
})

$('.emjon li').on('click', function () {
    var imgSrc = $(this).children('img').attr('src');
    $('.emjon').hide();
    var fromUserId = userId;
    var toUserId = $('#toUserId').val();
    var toGroupId = $('#toGroupId').val();
    var content = '<img class="Expr" src="' + imgSrc + '">';
    if (toUserId == '' && toGroupId == '') {
        $.DialogByZ.Alert({Title: "系统提示", Content: "请选择对话方", BtnL: "确定", FunL: alerts})
        return;
    }
    if (toUserId.length != 0) {
        ws.singleSend(fromUserId, toUserId, content);
    } else {
        ws.groupSend(fromUserId, toGroupId, content);
    }
    var userIcon = $('#userIcon').attr("src");
    var msg = '';
    msg += '<li>' +
        '<div class="news">' + '<span style="color:#70FF3B;font-weight:bold">' + new Date().format("yyyy-MM-dd hh:mm:ss") + '</span>' + '</br>' + content + '</div>' +
        '<div class="nesHead"><img src="' + userIcon + '"/></div>' +
        '</li>';
    processMsgBox.sendMsg(msg, toUserId, toGroupId);
    var $sendLi = $('.conLeft').find('li.bg');
    content = "[图片]";
    processFriendList.sending(content, $sendLi);
})