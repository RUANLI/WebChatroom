<%--
  Created by IntelliJ IDEA.
  User: ruan.li
  Date: 2020/1/16
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线聊天室——登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Transparent Sign In Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <%@ include file="/static/js/common/jsp/include.jsp" %>
    <!-- Font-Awesome-Icons-CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common/font-awesome.css?v=20200116"/>"/>
    <!-- Style-CSS -->
    <link rel="stylesheet" type="text/css" media="all" href="<c:url value="/static/css/login.css?v=20200116"/>"/>
    <script type="text/javascript" src="<c:url value="/static/js/login.js?v=20200116"/>"></script>
</head>
<body class="background">
<div class="header-w3l">
    <h1>在线聊天室</h1>
</div>
<div class="main-content-agile">
    <div class="sub-main-w3">
        <h2>登录</h2>
        <form>
            <div class="icon1">
                <input placeholder="用户名" id="username" type="text"/>
            </div>

            <div class="icon2">
                <input placeholder="密码" id="password" type="password"/>
            </div>

            <div class="clear"></div>
            <input type="button" value="登录" onclick="login()"/>
        </form>
    </div>
</div>
<div class="footer">
    <p>© Copyright 2020 素小黑 Corporation, All Rights Reserved</p>
</div>
</body>
</html>
