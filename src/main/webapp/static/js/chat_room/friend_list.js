var processFriendList = new PROCESS_FRIEND_LIST();
$(function () {

});

function PROCESS_FRIEND_LIST() {
    this.sending = function sending(content, $sendLi) {
        // 1. 设置部分新消息提醒
        if (content.length > 8) {
            content = content.substring(0, 8) + "...";
        }
        $('.conLeft').find('li.bg').children('.liRight').children('.infor').text(content);
        // 2. 如果存在新消息提醒徽章，则去除徽章
        if ($sendLi.find('.layui-badge').length > 0) {
            $sendLi.find('.layui-badge').remove();
        }
        //$('.conLeft ul').prepend('<li class="bg">' + $sendLi.html() + '</li>');
        // 3. 好友框新消息置顶
        $('.conLeft ul').prepend($sendLi.prop("outerHTML"));
        $sendLi.remove();
        $('.conLeft ul li').first().on('click', friendLiClickEvent)
    }
    this.receiving = function receiving(content, $receiveLi) {
        // 1. 设置红色提醒徽章
        var $badge = $receiveLi.find(".layui-badge");
        if ($badge.length > 0) {
            $badge.html(parseInt($badge.html()) + 1);
        } else {
            var badgeHTML = '<span class="layui-badge badge-avatar">1</span>';
            $receiveLi.children(".liLeft").prepend(badgeHTML);
        }
        // 2. 设置部分新消息提醒
        if (content.length > 8) { // 只显示前八个字符
            content = content.substring(0, 8) + "...";
        }
        if (content.search("<img") != -1) { // 若是图片，显示 “[图片]”
            content = "[图片]";
        }
        $receiveLi.children(".liRight").children('.infor').text(content);

        // 3. 新消息置顶
        $('.conLeft ul').prepend($receiveLi.prop("outerHTML"));
        $('.conLeft ul li').first().on('click', friendLiClickEvent);
        $receiveLi.remove();
    }
}
function friendLiClick() {
    $(".chat-notes").hide().removeClass("show");
    $(".chat-notes ul").find("li").remove();//移除上一个好友的聊天记录
}

// 好友框点击事件
function friendLiClickEvent() {

    // 1. 设置点击阴影效果
    $(this).addClass('bg').siblings().removeClass('bg');

    // 2. 设置显示右侧消息框
    $('.conRight').css("display", "-webkit-box");

    // 3. 设置消息框显示对方信息，清空对方id
    var intername = $(this).children('.liRight').children('.intername').text();
    var toUserId = $(this).children('.liRight').children('.hidden-userId').text();
    var toGroupId = $(this).children('.liRight').children('.hidden-groupId').text();
    /*alert('userId:' + (toUserId.length != 0));
    alert('groupId:' + toGroupId);*/
    $('.headName').text(intername);
    $('#toUserId').val("");
    $('#toGroupId').val("");

    // 4. 设置显示已收到的信息，设置好对方的id
    $('.newsList').html('');
    var messageArray;
    if (toUserId.length != 0) {
        messageArray = sentMessageMap.get(toUserId);
        $('#toUserId').val(toUserId);
    } else {
        messageArray = sentMessageMap.get(toGroupId);
        $('#toGroupId').val(toGroupId);
    }
    for (var i = 0; i < messageArray.length; i++) {
        $('.newsList').append(messageArray[i]);
    }

    // 5.设置消息框滚动条滑到底部
    $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight);

    // 6. 去掉红色提醒徽章
    var $badge = $(this).find(".layui-badge");
    if ($badge.length > 0) {
        $badge.remove();
    }
}