<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
  request.setCharacterEncoding("utf-8");
  //处理上传的图片
  
// <button id="movie_admin">录入</button>
%>
<!DOCTYPE html>
<html>
<head>
  <title>录入页</title>
  <link rel="stylesheet" type="text/css" href="public/css/index.css">
  <link rel="stylesheet" type="text/css" href="public/css/reset.css">
  <link rel="stylesheet" type="text/css" href="public/css/addMovie.css">
  <script type="text/javascript" src="public/js/index.js"></script>
  <script type="text/javascript" src="public/js/addMovie.js"></script>
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

	<!--增加电影的表单-->
  <div class="add-content" >
    <div class="add-topic">
      <p>电影录入页</p>
    </div>
    <form class="add-detail" action="details.jsp" method="post" enctype="multipart/form-data">
      <div class="detail">
        <label>电影名称</label>
        <input type="text" name="movieName" id="movie-name">
      </div>
      <div class="detail">
        <label>导演</label>
        <input type="text" name="director" id="movie-director">
      </div>
      <div class="detail">
        <label>上映年份</label>
        <input type="text" name="year" id="movie-year">
      </div>
      <div class="detail">
        <label>演员</label>
        <input type="text" name="actor" id="movie-actor">
      </div>
      <div class="detail">
        <label>海报上传</label>
        <input type="file" name="poster" id="movie-post">
      </div>
      <div class="detail">
      	<label>类别</label>
      	<select name="classes">
      		<option value="动作" selected>动作</option>
      		<option value="喜剧" >喜剧</option>
      		<option value="爱情">爱情</option>
      		<option value="科幻">科幻</option>
      		<option value="悬疑">悬疑</option>
      		<option value="恐怖">恐怖</option>
      		<option value="动画">动画</option>
      	</select>
      </div>
      <div class="detail">
        <label class="des">电影简介</label>
        <textarea type="text" name="descri" id="movie-descri"></textarea>
      </div>
      <input id="movie_admin" type="submit" value="录入">
    </form>
  </div>

  <!--footer-->
  <div class="footer-wrapper">
    <div class="bottom-footer">
        <p>Copyright © 2017 Movie. All Rights Reserved. </p>
    </div>
  </div>
  <!--登陆框-->
  <div class="ui-mask" id="mask" onselectstart="return false"></div>
  <form class="ui-dialog " id="dialog-Login" onselectstart='return false;'>
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
        <a class="ui-dialog-submit" href="index.jsp">登录</a>
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_regist">立即注册</a>
      </div>
    </div>
  </form>

  <!--注册框-->
  <form class="ui-dialog " id="dialog-register" onselectstart='return false;'>
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
        <a class="ui-dialog-submit" href="index.jsp">注册</a>
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_login">立即登录</a>
      </div>
    </div>
  </form>


  <script type="text/javascript" src="public/js/index.js"></script>
</body>
</html>
