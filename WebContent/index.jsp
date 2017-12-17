<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ include file="DB.jsp" %>
<%
  request.setCharacterEncoding("utf-8");
  String class_str = request.getParameter("class");
  String searchButton = request.getParameter("searchButton");
  String search = request.getParameter("search");
  System.out.print("searchButton:,"+searchButton);
  System.out.print("search:,"+search);
 // boolean b = connect();
  List<Map<String,String>> list = null;
 // if(searchButton != null || searchButton != "" ) {
//	  list = queryMovie(search);
//	  System.out.print("查询");
 // }else {
	 if(searchButton == null) {
	  System.out.print("分类");
	  if(class_str == null) {
	  	  list = movieClass("全部"); 
	  } else if(class_str != null && class_str.equals("all")) {
	     list = movieClass("全部");
	   } else if(class_str.equals("act")) {
	     list = movieClass("动作");
	    } else if(class_str.equals("laug")) {
	   list = movieClass("喜剧");
	   } else if(class_str.equals("lov")) {
	     list = movieClass("爱情");
	    } else if(class_str.equals("sc")) {
	     list = movieClass("科幻");
	    } else if(class_str.equals("sup")) {
	     list = movieClass("悬疑");
	    } else if(class_str.equals("cart")) {
	     list = movieClass("动画");
	    }	  
    } else {
    	list = queryMovie(search, 1);
 	    System.out.print("查询");
    }
  

  if(list== null) {
	  System.out.print("list null:"+class_str);
  }else {
	  System.out.print("class_str "+class_str);
  }


  // 全部电影


  // 动作
 // List<Map<String,String>> actionList = movieClass("动作");
 // String act_str = request.getParameter("class");

  // 喜剧
 // List<Map<String,String>> laughList = movieClass("喜剧");
 // String laug_str =  request.getParameter("class");

  // 爱情
 // List<Map<String,String>> loveList = movieClass("爱情");
 // String lov_str =  request.getParameter("class");
  // 科幻
 // List<Map<String,String>> scList = movieClass("科幻");
 // String sc_str =  request.getParameter("class");
  // 悬疑
 // List<Map<String,String>> supList = movieClass("悬疑");
 // String sup_str =  request.getParameter("class");
  // 恐怖
 // List<Map<String,String>> afraidList = movieClass("恐怖");
 // String afr_str =  request.getParameter("class");
  // 动画
 // List<Map<String,String>> cartonList = movieClass("动画");
 //  String cartstr =  request.getParameter("class");


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
        <%if(session.getAttribute("username") == null) {%>
          <span class="btn_login"><a id="btn_login">登录</a></span>
          <span style="color: white">&nbsp;|</span><span class="btn_regis"><a id="btn_regis">注册</a></span>
        <%}else {%>
          <span class="welcome" style="color: white">欢迎，</span><span style="color: white"><%=session.getAttribute("username")%></span>
          <span style="color: white">&nbsp;|</span><span class="btn_logout"><a id="btn_logout" href="logout.jsp">登出</a></span>
        <%}%>
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
            <img src="public/image/slider4.png" width="960" height="220" alt="轮播图1">
        </div>
    </div>
    <div class="banner">
        <div class="banner-img">
            <img src="public/image/slider5.png" width="960" height="220" alt="轮播图1">
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
  <div class="content-wrapper clearfx">
    <div class="topic">
      <p>电影 <input type="button" value="添加" id="add" ></input>
      	<span  id="alert" class="alert">请先登录再添加电影</span> </p>
      <ul class="class">
        <a href="index.jsp?class=all">
          <%if(class_str == null|| class_str.equals("all")){ %>
            <li class="selected">全部</li>
           <%}else{ %>
             <li>全部</li>
            <%}%>
        </a>
        <a href="index.jsp?class=act">
          <% 
            if(class_str != null && class_str.equals("act")){ %>
            <li class="selected">动作</li>
           <%}else{ %>
             <li>动作</li>
            <%}%>
        </a>
        <a href="index.jsp?class=laug">
          <%if( class_str != null && class_str.equals("laug")){ %>
             <li class="selected">喜剧</li>
           <%}else{ %>
             <li>喜剧</li>
           <%}%>
        </a>
        <a href="index.jsp?class=lov">
          <%if(class_str != null && class_str.equals("lov")){ %>
            <li class="selected">爱情</li>
           <%}else{ %>
             <li>爱情</li>
            <%}%>
        </a>
        <a href="index.jsp?class=sc">
          <%if( class_str != null && class_str.equals("sc")){ %>
            <li class="selected">科幻</li>
           <%}else{ %>
             <li>科幻</li>
            <%}%>
        </a>
        <a href="index.jsp?class=sup">
          <%if( class_str != null && class_str.equals("sup")){ %>
            <li class="selected">悬疑</li>
           <%}else{ %>
             <li>悬疑</li>
            <%}%>
        </a>
        <a href="index.jsp?class=afr">
          <%if(class_str != null && class_str.equals("afr")){ %>
            <li class="selected">恐怖</li>
           <%}else{ %>
             <li>恐怖</li>
            <%}%>
        </a>
        <a href="index.jsp?class=cart">
          <%if(class_str != null && class_str.equals("cart")){ %>
            <li class="selected">卡通</li>
           <%}else{ %>
             <li>卡通</li>
            <%}%>
        </a>
      </ul>
      <div class="search">
        <form action="index.jsp?sear=1">
	        <input type="text" name="search" autocomplete="off" placeholder="搜索影片" class="text">
	        <input type="submit" name="searchButton" id="searchButton" class="search-button" value="">
        </form>
      </div>
    </div>
    <div class="content clearfx">
      <% 
        System.out.print("进去了");
         if(list != null && list.size() != 0) {
           System.out.print("list不为空 " + list.size());
          for(int i = 0; i<list.size();i++) {%>
        <div class="movie-item">
           <a href="details.jsp?mid=<%=list.get(i).get("id") %>"><img src="<%=list.get(i).get("pic")%>" width=100% height=100%></a>
           <a href="details.jsp?mid=<%=list.get(i).get("id") %>"><p><%=list.get(i).get("name")%></p></a>
         </div>
      <%} } else { 
             System.out.print("站务吗"); %>
          <p>暂无内容</p>
       <%}%>
    </div>
  </div>
  <!--footer-->
  <div class="footer-wrapper">
    <div class="bottom-footer">
        <p>Copyright © 2017 Movie. All Rights Reserved. </p>
    </div>
  </div>
  <!--登陆框-->
  <div class="ui-mask" id="mask" onselectstart="return false"></div>
  <form class="ui-dialog " id="dialog-Login" method="post" action="checkLogin.jsp" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      登录通行证
      <a class="ui-dialog-closebutton"  id="close_login"></a>
    </div>
    <input  type="hidden" name="from" id="from" value="*">
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" id="login_username" name="username" type="text" placeholder="用户名" autocomplete="off">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" id="login_password" name="password" type="text" onfocus="this.type='password'" placeholder="密码" autocomplete="off">
      </div>
      <div>
        <input type="submit" name="login" class="ui-dialog-submit" value="登录" id="to_login">
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_regist">立即注册</a>
      </div>
      <div id="error1" style="display: none; color: red; text-align: center;">密码不能为中文且必须2位数以上</div>
    </div>
  </form>
  <!--注册框-->
  <form class="ui-dialog " id="dialog-register" method="post" action="checkRegist.jsp" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      注册账号
      <a class="ui-dialog-closebutton" id="close_regist"></a>
    </div>
    <input  type="hidden" name="from" id="from2" value="*">
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" id="regis_username" name="username" type="text" placeholder="用户名" autocomplete="off">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" id="regis_password" name="password" type="text" onfocus="this.type='password'" placeholder="密码" autocomplete="off">
      </div>
      <div>
        <input type="submit" class="ui-dialog-submit" value="注册" name="register" id="to_register">
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_login">立即登录</a>
      </div>
      <div id="error" style="display: none; color: red; text-align: center;">用户名或密码不能为空且密码长度不能小于2</div>
    </div>
  </form>

  <script type="text/javascript" src="public/js/index.js"></script>
  <script language="JavaScript">
  //对添加按钮的监听
  	var addMovie = document.getElementById('add');
  	addMovie.onclick = function() { 	
 		var ses = "<%=session.getAttribute("username")%>";
 		if(ses!="null"){  	
 			window.location.href = "addMovie.jsp";
  		}else{
  			document.getElementById('alert').style.display = 'inline';
  			document.getElementById('dialog-Login').style.display = 'block';
  			document.getElementById('mask').style.display = 'block';
  			document.getElementById('from').value = 'add';
  			document.getElementById('from2').value = 'add';
  		}
  	}
 </script>
</body>
</html>

