<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
  request.setCharacterEncoding("utf-8");
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  
%>
<!DOCTYPE HTML>
<html>
<head>
  <title>电影网站首页</title>
  <link rel="stylesheet" type="text/css" href="public/css/index.css">
  <link rel="stylesheet" type="text/css" href="public/css/reset.css">
  <script type="text/javascript" src="public/js/index.js"></script>
</head>
<body>
  <!--导航栏-->
  <div class="nav-wrapper">
    <div class="nav-content">
      <img class="logo" src="public/image/hdmovie_32.png">
      <ul>
        <li><a href="#">首页</a></li>
        <li><a href="#">关于我们</a></li>
      </ul>
      <div class="login_register">
        <span class="btn_login"><a id="btn_login">登录</a></span>
        <span style="color: white">&nbsp;|</span><span class="btn_regis"><a id="btn_regis">注册</a></span>
      </div>
    </div>
  </div>
  <!--轮播图-->
  <div id="slider-wrapper">
    <div class="banner">
        <div class="banner-img">
            <img src="public/image/slider1.png" width="960" height="220" alt="轮播图1">
        </div>
    </div>
    <div class="banner">
        <div class="banner-img">
            <img src="public/image/slider2.png" width="960" height="220" alt="轮播图1">
        </div>
    </div>
    <div class="banner">
        <div class="banner-img">
            <img src="public/image/slider3.png" width="960" height="220" alt="轮播图1">
        </div>
    </div>
    <div class="banner">
        <div class="banner-img">
            <img src="public/image/slider1.png" width="960" height="220" alt="轮播图1">
        </div>
    </div>
    <div class="banner">
        <div class="banner-img">
            <img src="public/image/slider2.png" width="960" height="220" alt="轮播图1">
        </div>
    </div>
    <div class="tab">
        <span id="button"></span>
        <span id="button"></span>
        <span id="button"></span>
        <span id="button"></span>
        <span id="button"></span>
    </div>
    <div class="prev arrow">&lt;</div>
    <div class="next arrow">&gt;</div>
  </div>
  <!--电影内容-->
  <div class="content-wrapper">
    <div class="topic">
      <p>电影</p>
      <ul class="class">
        <li class="selected">全部</li>
        <li>动作</li>
        <li>喜剧</li>
        <li>爱情</li>
        <li>科幻</li>
        <li>悬疑</li>
        <li>恐怖</li>
        <li>动画</li>
      </ul>
      <div class="search">
        <input type="text" name="search" autocomplete="off" placeholder="搜索影片" class="text">
        <input type="button" name="searchButton" id="searchButton" class="search-button">
      </div>
    </div>
    <div class="content"></div>
  </div>
  <!--footer-->
  <div class="footer-wrapper">
    <div class="bottom-footer">
        <p>Copyright © 2017 Movie. All Rights Reserved. </p>
    </div>
  </div>
  <!--登陆框-->
  <div class="ui-mask" id="mask" onselectstart="return false" style="display: block;"></div>
  <form class="ui-dialog " id="dialog-Login" method="post" action="checkLogin.jsp" onselectstart='return false;' style="display: block;">
    <div class="ui-dialog-title" onselectstart="return false;">
      登陆通行证
      <a class="ui-dialog-closebutton"  id="close_login" style="display: none;"></a>
    </div>
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" id="login_username" name="username" type="text" placeholder="用户名">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" id="login_password" name="password" type="text" onfocus="this.type='password'" placeholder="密码">
      </div>
      <div>
        <input type="submit" name="login" class="ui-dialog-submit" value="登录" id="to_login">
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_regist">立即注册</a>
      </div>
    </div>
  </form>
  <!--注册框-->
  <form class="ui-dialog " id="dialog-register" method="post" action="checkRegist.jsp" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      注册账号
      <a class="ui-dialog-closebutton" id="close_regist" style="display: none;"></a>
    </div>
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" id="regis_username" name="username" type="text" placeholder="用户名">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" id="regis_password" name="password" type="text" onfocus="this.type='password'" placeholder="密码">
      </div>
      <div>
        <input type="submit" class="ui-dialog-submit" value="注册" name="register" id="to_register">
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_login">立即登录</a>
      </div>
      <div id="error" style="display: none; color: red; text-align: center;">用户名或密码不能为空</div>
    </div>
  </form>

  <script type="text/javascript" src="public/js/index.js"></script>
</body>
</html>
<%@ include file="DB.jsp" %>
