var processMsgBox = new PROCESS_MSG_BOX();
$(function () {

});

function PROCESS_MSG_BOX() {
    this.sendMsg = function sendMsg(msg, toUserId, toGroupId) {
        // 1. 把内容添加到消息框
        $('.newsList').append(msg);
        // 2. 手动计算、调整回显消息show的宽度
        var $newsDiv = $('.newsList li').last().children("div").first();
        var fixWidth = 300; // 自定义的消息框本身的最长宽度
        var maxWidth = 493; // 消息框所在行(div)的满宽度(不包含头像框的宽度部分)
        var minMarginLeftWidth = 224; // 按理说应该是 maxwidth - fixWidth，这里出现了点问题
        var marginLeftWidth; // 要计算消息框的margin-left宽度
        if ($newsDiv.actual('width') < fixWidth) {
            marginLeftWidth = maxWidth - $newsDiv.actual('width');
            ;
            $newsDiv.css("margin-left", marginLeftWidth + "px");
        } else {
            $newsDiv.css("width", fixWidth + "px")
                .css("margin-left", minMarginLeftWidth + "px");
        }

        // 3. 把调整后的消息html标签字符串 添加到已发送用户消息表
        if (toUserId.length != 0) {
            sentMessageMap.get(toUserId).push($('.newsList li').last().prop("outerHTML"));
        } else {
            sentMessageMap.get(toGroupId).push($('.newsList li').last().prop("outerHTML"));
        }

        // 4. 滚动条往底部移
        $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight);
    },

        this.sendFileMsg = function sendFileMsg(msg, toUserId, toGroupId) {
            // 注意，文件信息消息框不需要计算宽度，已通过css设置好固定的样式
            // 1. 回显发送的新消息
            $('.newsList').append(msg);

            // 2. 把消息html标签字符串 添加到已发送用户消息表
            if (toUserId.length != 0) {
                sentMessageMap.get(toUserId).push($('.newsList li').last().prop("outerHTML"));
            } else {
                sentMessageMap.get(toGroupId).push($('.newsList li').last().prop("outerHTML"));
            }

            // 3. 消息框往下移
            $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight);
        },

        this.receiveSingleMsg = function receiveSingleMsg(msg, fromUserId, toUserId) {
            // 1. 设置消息框可见
            $('.conRight').css("display", "-webkit-box");

            // 2. 把新消息放到暂存区$('.newsList-temp)，如果用户正处于与发出新消息的用户的消息框，则消息要回显
            $('.newsList-temp').append(msg);
            var $focusUserId = $(".conLeft .bg").find('span.hidden-userId');
            if ($focusUserId.length > 0 && $focusUserId.html() == fromUserId) {
                $('.newsList').append(msg);
            }

            // 3. 利用暂存区手动计算、调整新消息的宽度；
            var $answersDiv = $('.newsList-temp li').last().children("div").first();
            var fixWidth = 300; // 消息框本身的最长宽度
            var maxWidth = 480; // 消息框所在行(div)的满宽度(不包含头像框的宽度部分)
            var minMarginRightWidth = 212; // 按理说应该是 maxwidth - fixWidth，这里出现了点问题
            var marginRightWidth; // 要计算消息框的margin-right宽度
            if ($answersDiv.actual('width') < fixWidth) {
                marginRightWidth = maxWidth - $answersDiv.actual('width');
                $answersDiv.css("margin-right", marginRightWidth + "px");
                if ($focusUserId.length > 0 && $focusUserId.html() == fromUserId) {
                    $('.newsList li').last().children("div").first()
                        .css("margin-right", marginRightWidth + "px");
                }
            } else {
                $answersDiv.css("width", fixWidth + "px")
                    .css("margin-right", minMarginRightWidth + "px");
                if ($focusUserId.length > 0 && $focusUserId.html() == fromUserId) {
                    $('.newsList li').last().children("div").first()
                        .css("width", fixWidth + "px")
                        .css("margin-right", minMarginRightWidth + "px");
                }
            }

            // 4. 把 调整后的消息html标签字符串 添加到已发送用户消息表，并清空暂存区
            if (fromUserId === userId) {
                sentMessageMap.get(toUserId).push($('.newsList-temp li').last().prop("outerHTML"));
            } else {
                sentMessageMap.get(fromUserId).push($('.newsList-temp li').last().prop("outerHTML"));
            }
            $('.newsList-temp').empty();

            // 5. 滚动条滑到底
            $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight);
        },

        this.receiveGroupMsg = function receiveGroupMsg(msg, toGroupId) {
            // 1. 设置消息框可见
            $('.conRight').css("display", "-webkit-box");

            // 2. 把新消息放到暂存区$('.newsList-temp)，如果用户正处于与发出新消息的用户的消息框，则消息要回显
            $('.newsList-temp').append(msg);
            var $focusGroupId = $(".conLeft .bg").find('span.hidden-groupId');
            if ($focusGroupId.length > 0 && $focusGroupId.html() == toGroupId) {
                $('.newsList').append(msg);
            }

            // 3. 手动计算、调整回显消息的宽度
            var $answersDiv = $('.newsList-temp li').last().children("div").first();
            var fixWidth = 300; // 消息框本身的最长宽度
            var maxWidth = 480; // 消息框所在行(div)的满宽度(不包含头像框的宽度部分)
            var minMarginRightWidth = 212; // 按理说应该是 maxwidth - fixWidth，这里出现了点问题
            var marginRightWidth; // 要计算消息框的margin-right宽度
            if ($answersDiv.actual('width') < fixWidth) {
                marginRightWidth = maxWidth - $answersDiv.actual('width');
                $answersDiv.css("margin-right", marginRightWidth + "px");
                if ($focusGroupId.length > 0 && $focusGroupId.html() == toGroupId) {
                    $('.newsList li').last().children("div").first()
                        .css("margin-right", marginRightWidth + "px");
                }
            } else {
                $answersDiv.css("width", fixWidth + "px")
                    .css("margin-right", minMarginRightWidth + "px");
                if ($focusGroupId.length > 0 && $focusGroupId.html() == toGroupId) {
                    $('.newsList li').last().children("div").first()
                        .css("width", fixWidth + "px")
                        .css("margin-right", minMarginRightWidth + "px");
                }
            }

            // 4. 把 调整后的消息html标签字符串 添加到已发送用户消息表，并清空暂存区
            sentMessageMap.get(toGroupId).push($('.newsList-temp li').last().prop("outerHTML"));
            $('.newsList-temp').empty();

            // 5. 滚动条滑到底(Firefox不兼容)
            $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight);
            // css加height: 200px;//获取，兼容火狐谷歌
        }
}