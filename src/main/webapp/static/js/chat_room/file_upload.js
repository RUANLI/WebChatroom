$(".myfile").fileinput({
    uploadUrl: "chatroom/upload",
    uploadAsync: true, //默认异步上传
    showUpload: true, //是否显示上传按钮,跟随文本框的那个
    showRemove: false, //显示移除按钮,跟随文本框的那个
    showCaption: false,//是否显示标题,就是那个文本框
    showPreview: true, //是否显示预览,不写默认为true
    dropZoneTitle: "请通过拖拽图片文件放到这里",
    dropZoneEnabled: false,//是否显示拖拽区域/多文件上传，默认不写为true，但是会占用很大区域
    maxFileSize: 30720,//单位为kb，如果为0表示不限制文件大小
    maxFileCount: 1, //表示允许同时上传的最大文件个数
    enctype: 'multipart/form-data',
    validateInitialCount: true,
    previewFileIcon: "<i class='glyphicon glyphicon-file'></i>",
    msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
    language: 'zh'//设置语言
})

//异步上传返回错误结果处理
$('.myfile').on('fileerror', function (event, data, msg) {
    console.log("上传错误");
    console.log(data);
});

//异步上传返回成功结果处理
$(".myfile").on("fileuploaded", function (event, data, previewId, index) {

    // 1. 上传成功1.5秒后自动关闭上传模态框
    console.log("上传成功");
    setTimeout(function () {
        $('#upload-cancel').trigger('click');
        $('.fileinput-remove').trigger('click');
    }, 1500);

    // 2. 获取、设置参数
    var returnData = data.response.data;
    var originalFilename = returnData.originalFilename;
    var fileSize = returnData.fileSize;
    var fileUrl = returnData.fileUrl;
    var content = "[文件]";
    var fromUserId = userId;
    var userIcon = $('#userIcon').attr("src");
    var $sendLi = $('.conLeft').find('li.bg');
    var toUserId = $('#toUserId').val();
    var toGroupId = $('#toGroupId').val();
    var fileHtml =

        '<li>' +
        '<div class="times" >' + '<span style="color:#70FF3B;font-weight:bold">' + new Date().format("yyyy-MM-dd hh:mm:ss") + '</span>' + '</div>' +
        '<div class="send-file-shown">' +
        '<div class="media">' +
        '<a href="' + fileUrl + '" download="" class="media-left">' +
        '<i class="glyphicon glyphicon-file" style="font-size:28pt;"></i>' +
        '</a>' +
        '<div class="media-body"> ' +
        '<h5 class="media-heading">' + originalFilename + '</h5>' +
        '<span>' + fileSize + '</span>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="nesHead"><img src="' + userIcon + '"/></div>' +
        '</li>';

    // 3. 发送信息到服务器
    if (toUserId.length != 0) {
        ws.fileMsgSingleSend(fromUserId, toUserId, originalFilename, fileUrl, fileSize);
    } else {
        ws.fileMsgGroupSend(fromUserId, toGroupId, originalFilename, fileUrl, fileSize);
    }

    // 4. 消息框处理：
    processMsgBox.sendFileMsg(fileHtml, toUserId, toGroupId);

    // 5. 好友列表处理
    processFriendList.sending(content, $sendLi);
});