# -
https://segmentfault.com/a/1190000015681145?utm_source=tag-newest
本项目是借助大佬==Kanarien==的聊天室基础上改进的,加了离线消息 ，和数据库
# 互联网实时聊天系统 (SSM + Netty + Websocket)

## 0. 前言

关于Netty
> Netty 是一个利用 Java 的高级网络的能力，隐藏其背后的复杂性而提供一个易于使用的 API 的客户端/服务器框架。

详细的可参考阅读该书的电子版
* [Essential Netty in Action 《Netty 实战(精髓)》](https://legacy.gitbook.com/book/waylau/essential-netty-in-action/details)

关于WebSocket通信协议
> WebSocket是为了解决HTTP协议中通信只能由客户端发起这个弊端而出现的，WebSocket基于HTTP5协议，借用HTTP进行握手、升级，能够做到轻量的、高效的、双向的在客户端和服务端之间传输文本数据。

## 1. 技术准备
* IDE：MyEclipse 2016
* JDK版本：1.8.0_121
* 浏览器：谷歌浏览器、360浏览器（极速模式）（涉及网页前端设计，后端开发表示很苦闷）
* 涉及技术：
  * Netty 4
  * WebSocket + HTTP
  * Spring MVC + Spring
  * JQuery
  * Bootstrap 3 + Bootstrap-fileinput
  * Maven 3.5
  * Tomcat 8.5

## 2. 整体说明
### 2.1 设计思想
整个通信系统**以Tomcat作为核心服务器运行，其下另开一个线程运行Netty WebSocket服务器**，Tomcat服务器主要处理客户登录、个人信息管理等的HTTP类型请求（通常的业务类型），端口为8080，Netty WebSockt服务器主要处理用户消息通信的WebSocket类型请求，端口为3333。用户通过浏览器登录后，浏览器会维持一个Session对象（有效时间30分钟）来保持登录状态，Tomcat服务器会返回用户的个人信息，同时记录在线用户，根据用户id建立一条WebSocket连接并保存在后端以便进行实时通信。当一个用户向另一用户发起通信，服务器会根据消息内容中的对话方用户id，找到保存的WebSocket连接，通过该连接发送消息，对方就能够收到即时收到消息。当用户注销或退出时，释放WebSocket连接，清空Session对象中的登录状态。

事实上Netty也可以用作一个HTTP服务器，而这里使用Spring MVC处理HTTP请求是出于熟悉的缘故，也比较接近传统开发的方式。

### 2.2 系统结构
系统采用B/S（Browser/Server），即浏览器/服务器的结构，主要事务逻辑在服务器端（Server）实现。借鉴MVC模式的思想，从上至下具体又分为视图层（View）、控制层（Controller）、业务层（Service）、模型层（Model）、数据访问层（Data Access）

### 2.3 项目结构
项目后端结构：
项目前端结构：

### 2.4 系统功能模块
系统只包括两个模块：登录模块和聊天管理模块。

* 登录模块：既然作为一个系统，那么登录的角色认证是必不可少的，这里使用简单、传统的Session方式维持登录状态，当然也有对应的注销功能，但这里的注销除了清空Session对象，还要释放WebSocket连接，否则造成内存泄露。
* 聊天管理模块：系统的核心模块，这部分主要使用Netty框架实现，功能包括信息、文件的单条和多条发送，也支持表情发送。
* 其他模块：如好友管理模块、聊天记录管理、注册模块等，我并没有实现，有兴趣的话可以自行实现，与传统的开发方式类似。



### 2.6 系统界面
## 3. 核心编码
这里只说明需要注意的地方，详细的请看源码

### 3.1 Netty服务器启动与关闭
**当关闭Tomcat服务器时，也要释放Netty相关资源，否则会造成内存泄漏**，

## 4. 效果及操作演示
4.1 聊天演示
(https://segmentfault.com/img/remote/1460000015681156?w=984&h=686)

4.2 文件上传演示
(https://segmentfault.com/img/remote/1460000015681157?w=1208&h=667)

---


