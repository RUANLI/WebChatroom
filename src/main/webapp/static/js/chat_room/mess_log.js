
/**
 * 消息记录
 */
function noteOpen() {
    if (!window.WebSocket) {
        return;
    }
    if (socket.readyState == WebSocket.OPEN) {
        var fromUserId = userId;
        var toUserId = $('#toUserId').val();
        var toGroupId = $('#toGroupId').val();
        // $(".chat-notes").toggle();//改变显示状态
        if ($(".chat-notes").hasClass("show")) {
            // 执行隐藏
            $(".chat-notes").hide().removeClass("show");
        } else {
            if ($(".chat-notes ul").find("li").length > 0) {//如果再次查看则不需要请求
                $(".chat-notes").show().addClass("show");
            } else {
                // 显示
                $(".chat-notes").show().addClass("show");
                var data1 = {"toUserId": toUserId, "fromUserId": fromUserId, "groupId": toGroupId};
                $.ajax({
                    type: 'POST',
                    url: 'chatroom/get_chatNotes',
                    data: JSON.stringify(data1),
                    contentType: "application/json",
                    async: true,
                    success: function (data) {
                        console.log("获取消息记录...");
                        console.log(data);
                        if (data.status === 200) {
                            var messageInfos = data.data.messageInfos;
                            var ChatNotesHTML = "";
                            for (var i = 0; i < messageInfos.length; i++) {
                                if (messageInfos[i].type == 1 || messageInfos[i].type == 2) {//消息
                                    ChatNotesHTML +=
                                        '<li>' +
                                        '<div class="notes" >' + '<span class="corle">' + messageInfos[i].fromUserName + '&nbsp' + new Date(messageInfos[i].userTime).format("yyyy-MM-dd hh:mm:ss") + '</span>' + '<br/>' +
                                        '<span style="color:#210A19;font-weight:bold">' + messageInfos[i].content + '</span>' + '</div>' +
                                        // '<div class="answerHead"><br/><img src="' + fromUserIcon + '"/></div> + '
                                        '</li>';
                                }
                                if (messageInfos[i].type == 3 || messageInfos[i].type == 4) {//文件
                                    ChatNotesHTML +=
                                        '<li>' +
                                        '<div class="notes">' +
                                        '<span class="corle">' + messageInfos[i].fromUserName + '&nbsp' + new Date(messageInfos[i].userTime).format("yyyy-MM-dd hh:mm:ss") + '</span>' +
                                        '<div class="note-file" >' +
                                        '<div class="media">' +
                                        '<div class="media-body"> ' +
                                        '<h5 class="media-heading">' + messageInfos[i].fileName + '</h5>' +
                                        '<span>' + messageInfos[i].fileSize + '</span>' +
                                        '</div>' +
                                        // '<div class="note-file-img">' +
                                        '<a href="' + messageInfos[i].fileUrl + '" download="" class="media-left">' +
                                        '<i class="glyphicon glyphicon-file" style="font-size:28pt;"></i>' +
                                        '</a>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</li>';
                                }
                            }

                            $('.notesList ul').append(ChatNotesHTML);
                            // 绑定好友框点击事件
                            $('.conLeft ul li').on('click', friendLiClick);
                        } else {
                            swal("data.msg")
                        }
                    }
                });
            }
        }
    } else {
        swal("Websocket连接没有开启")
    }
}