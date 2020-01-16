function login() {
    $.ajax({
        type : 'POST',
        url : 'login',
        dataType: 'json',
        data : {
            userName: $("#username").val(),
            userPassword: $("#password").val()
        },
        async : false,
        success: function(data) {
            if (data.status == 200) {
                window.location.href="chatroom";
            } else {
                alert(data.msg);
            }
        }
    });
}