function logout() {
    // 1. 关闭websocket连接
    ws.remove();

    // 2. 注销登录状态
    $.ajax({
        type: 'POST',
        url: 'logout',
        dataType: 'json',
        async: true,
        success: function (data) {
            if (data.status == 200) {
                // 3. 注销成功，进行页面跳转
                console.log("注销成功！");
                window.location.href = "login";
            } else {
                swal("data.msg")
            }
        }
    });
}