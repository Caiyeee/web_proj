<<<<<<< HEAD
<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
  request.setCharacterEncoding("utf-8");

%>
<!DOCTYPE HTML>
<html>
<head>
  <title>详情</title>
  <link rel="stylesheet" type="text/css" href="public/css/index.css">
  <link rel="stylesheet" type="text/css" href="public/css/reset.css">
  <link rel="stylesheet" type="text/css" href="public/css/details.css">
  <script type="text/javascript" src="public/js/details.js"></script>
</head>
<body>
  <!--导航栏-->
  <div class="nav-wrapper">
    <div class="nav-content">
      <img class="logo" src="public/image/hdmovie_32.png">
      <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="#">关于我们</a></li>
      </ul>
      <div class="login_register">
        <span class="btn_login"><a id="btn_login">登录</a></span>
        <span style="color: white">&nbsp;|</span><span class="btn_regis"><a id="btn_regis">注册</a></span>
      </div>
    </div>
  </div>
  
  <!-- 影片详情 -->
  <div class="detail">
  	<p id="moviename">怦然心动</p>
  	<p id="moviepic"><img class="poster" src="public/image/flipped.jpeg"></p>
  	<div id="movieinfo">
  	<p>导演：</p><br>
  	<p>主演：</p><br>
  	<p>上映年份：</p><br>
  	<p>类别：</p><br>
  	</div>
  </div>
  
  <div class="plot">剧情简介：</div>
  
  <div class="editcomment">
  	<p><img id="editicon" src="public/image/editicon.png"></p>
  	<a id="shortcomment" href="#">&nbsp;我要写短评</a>
  </div><br>
  
  <div class="somecomments">
  		<p id="comtitle">怦然心动的短评</p>
  </div>
 
  <!--footer-->
  <div class="footer-wrapper">
    <div class="bottom-footer">
        <p>Copyright © 2017 Movie. All Rights Reserved. </p>
    </div>
  </div>
  <!--登陆框-->
  <div class="ui-mask" id="mask" onselectstart="return false"></div>
  <div class="ui-dialog " id="dialog-Login" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      登陆通行证
      <a class="ui-dialog-closebutton"  id="close_login"></a>
    </div>
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" name="username" type="input" placeholder="用户名">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" name="password" type="input" placeholder="密码">
      </div>
      <div>
        <a class="ui-dialog-submit" href="details.jsp">登录</a>
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_regist">立即注册</a>
      </div>
    </div>
  </div>

  <!--注册框-->
  <div class="ui-dialog " id="dialog-register" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      注册账号
      <a class="ui-dialog-closebutton" id="close_regist"></a>
    </div>
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" name="username" type="input" placeholder="用户名">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" name="password" type="input" placeholder="密码">
      </div>
      <div>
        <a class="ui-dialog-submit" href="details.jsp">注册</a>
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_login">立即登录</a>
      </div>
    </div>
  </div>


  <script type="text/javascript" src="public/js/details.js"></script>
</body>
</html>
=======
<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
  request.setCharacterEncoding("utf-8");

%>
<!DOCTYPE HTML>
<html>
<head>
  <title>详情</title>
  <link rel="stylesheet" type="text/css" href="public/css/index.css">
  <link rel="stylesheet" type="text/css" href="public/css/reset.css">
  <link rel="stylesheet" type="text/css" href="public/css/details.css">
  <script type="text/javascript" src="public/js/details.js"></script>
</head>
<body>
  <!--导航栏-->
  <div class="nav-wrapper">
    <div class="nav-content">
      <img class="logo" src="public/image/hdmovie_32.png">
      <ul>
      </ul>
      <div class="login_register">
        <span class="btn_login"><a id="btn_login">登录</a></span>
        <span style="color: white">&nbsp;|</span><span class="btn_regis"><a id="btn_regis">注册</a></span>
      </div>
    </div>
  </div>
  
  <!-- 影片详情 -->
  <div class="detail">
  	<p id="moviename">怦然心动</p>
  	<p id="moviepic"><img class="poster" src="public/image/flipped.jpeg"></p>
  	<div id="movieinfo">
  	<p>导演：</p><br>
  	<p>主演：</p><br>
  	<p>上映年份：</p><br>
  	<p>类别：</p><br>
  	</div>
  </div>
  
  <div class="plot">剧情简介：</div>
  
  <div class="editcomment">
  	<p><img id="editicon" src="public/image/editicon.png"></p>
  	<a id="shortcomment" href="#">&nbsp;我要写短评</a>
  </div><br>
  
  <div class="somecomments">
  		<p id="comtitle">怦然心动的短评</p>
  </div>
 
  <!--footer-->
  <div class="footer-wrapper">
    <div class="bottom-footer">
        <p>Copyright © 2017 Movie. All Rights Reserved. </p>
    </div>
  </div>
  <!--登陆框-->
  <div class="ui-mask" id="mask" onselectstart="return false"></div>
  <div class="ui-dialog " id="dialog-Login" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      登陆通行证
      <a class="ui-dialog-closebutton"  id="close_login"></a>
    </div>
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" name="username" type="input" placeholder="用户名">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" name="password" type="input" placeholder="密码">
      </div>
      <div>
        <a class="ui-dialog-submit" href="details.jsp">登录</a>
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_regist">立即注册</a>
      </div>
    </div>
  </div>

  <!--注册框-->
  <div class="ui-dialog " id="dialog-register" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      注册账号
      <a class="ui-dialog-closebutton" id="close_regist"></a>
    </div>
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" name="username" type="input" placeholder="用户名">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" name="password" type="input" placeholder="密码">
      </div>
      <div>
        <a class="ui-dialog-submit" href="details.jsp">注册</a>
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_login">立即登录</a>
      </div>
    </div>
  </div>


  <script type="text/javascript" src="public/js/details.js"></script>
</body>
</html>
>>>>>>> 34389096be58fb107de0afec48f3cc66b72d48b5
