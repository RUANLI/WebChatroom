/**
 常量：
 CONNECTING：值为0，表示正在连接。
 OPEN：值为1，表示连接成功，可以通信了。
 CLOSING：值为2，表示连接正在关闭。
 CLOSED：值为3，表示连接已经关闭，或者打开连接失败。
 属性：
 WebSocket.binaryType
 使用二进制的数据类型连接
 WebSocket.bufferedAmount 只读
 未发送至服务器的字节数
 WebSocket.extensions 只读
 服务器选择的扩展
 WebSocket.onclose
 用于指定连接关闭后的回调函数
 WebSocket.onerror
 用于指定连接失败后的回调函数
 WebSocket.onmessage
 用于指定当从服务器接受到信息时的回调函数
 WebSocket.onopen
 用于指定连接成功后的回调函数
 WebSocket.protocol 只读
 服务器选择的下属协议
 WebSocket.readyState 只读
 当前的链接状态
 WebSocket.url 只读
 WebSocket 的绝对路径
 **/

var userId;
var socket;
var sentMessageMap;
var lockReconnect = false; //避免重复连接
var wsUrl = "ws://192.168.2.34:8899";
//用户信息加载
setUserInfo();
//检测浏览器是否支持WebSocket
if (!window.WebSocket) {
    window.WebSocket = window.MozWebSocket;
}
if (window.WebSocket) {
    createWebSocket();
} else {
    swal("您的浏览器不支持WebSocket！");
}

function createWebSocket() {//构建连接
    try {
        socket = new WebSocket(wsUrl);
        initEventHandle();
    } catch (e) {
        reconnect();
        console.log("连接失败：" + e);
    }
}

function initEventHandle() {
    // 登录成功1秒后，将用户信息注册到服务器在线用户表
    socket.onopen = setTimeout(function (event) {
        ws.register();
        console.log("WebSocket已成功连接！");
        heartCheck.start();//心跳检测开启
    }, 1000);
    //从服务器接收信息
    socket.onmessage = function (event) {
        heartCheck.reset().start();//服务器返回数据监听
        var json = JSON.parse(event.data);
        if (json.status == 200) {
            var type = json.data.type;
            console.log("收到一条新信息，类型为：" + type);
            switch (type) {
                case "REGISTER":
                    ws.registerReceive();
                    break;
                case "HEART_SERVICE":
                    ws.heartBeatReceive();
                    break;
                case "SINGLE_SENDING":
                    ws.singleReceive(json.data);
                    break;
                case "GROUP_SENDING":
                    ws.groupReceive(json.data);
                    break;
                case "FILE_MSG_SINGLE_SENDING":
                    ws.fileMsgSingleRecieve(json.data);
                    break;
                case "FILE_MSG_GROUP_SENDING":
                    ws.fileMsgGroupRecieve(json.data);
                    break;
                default:
                    console.log("不正确的类型！");
            }
        } else {
            swal("OMG!", json.msg, "error");
            console.log(json.msg);
        }
    };
    socket.onclose = function (event) {
        console.log("WebSocket已关闭...");
        reconnect();//重连
    };
    socket.onerror = function (event) {
        console.log("异常信息警告" + event);
        reconnect();//重连
    }
}

//断线重连
function reconnect() {
    if (lockReconnect) {
        return;
    }
    ;
    lockReconnect = true;
    setTimeout(function () { //没连接上会一直重连，设置延迟避免请求过多
        createWebSocket();
        lockReconnect = false;
    }, 2000);
}

//心跳检测
var heartCheck = {
    timeout: 35000, //3秒
    timeoutObj: null,
    serverTimeoutObj: null,
    reset: function () {
        clearTimeout(this.timeoutObj);
        clearTimeout(this.serverTimeoutObj);
        return this;
    },
    start: function () {
        var self = this;
        this.timeoutObj = setTimeout(function () {
            //这里发送一个心跳，后端收到后，返回一个心跳消息，
            //onmessage拿到返回的心跳就说明连接正常
            ws.sendHeartBeat();
            self.serverTimeoutObj = setTimeout(function () { //如果超过一定时间还没重置，说明后端主动断开了
                socket.close(); //如果onclose会执行reconnect，我们执行ws.close()就行了.如果直接执行reconnect 会触发onclose导致重连两次
            }, self.timeout)
        }, this.timeout)
    }
}
// 监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
window.onbeforeunload = function () {
    socket.close();
}