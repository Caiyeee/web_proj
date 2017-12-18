<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
  	request.setCharacterEncoding("utf-8");
	String getmovieid = request.getParameter("mid");
	String moviename = "";
	String moviedirector = "";
	String moviestarring = "";
	String movieyear = "";
	String movieclass = "";
	String movieinfo = "";
	String moviecomment = "";
	String moviepost = "";
	String isLogin = "";
	String getcommentid = "";
	int getmovieuserid = -1;
	Object movieuser = session.getAttribute("username");
	Object ob = session.getAttribute("userId");
	
	if(ob != null)
		getmovieuserid = Integer.parseInt(String.valueOf(ob)); 
	
	if(movieuser == null){
		isLogin = "false";
	}
	else{
		isLogin = "true";
	}
	int movieid = Integer.parseInt(getmovieid);
	
	boolean b = connect();
	List<Map<String,String>> list = queryMovie(getmovieid,2);
	if(list != null){
		Map<String,String> map = list.get(0);
		moviename += map.get("name");
		moviedirector += map.get("director");
		moviestarring += map.get("starring");
		movieyear += map.get("year");
		movieclass += map.get("classes");
		movieinfo += map.get("info");
		moviepost += map.get("pic");
	}
	else {
		moviename = "null";
		moviedirector = "null";
		moviestarring = "null";
		movieyear = "null";
		movieclass = "null";
		movieinfo = "null";
		moviepost = "null";
	}
	
	List<Map<String,String>> commentlist = queryComment(movieid);
	
	String fontstyle = "";
	String editstr = "";
	String isRead = "";
	String deletecommentid = "";
	String sub1 = "";
	String sub2 = "";
	String sub3 = "";
	
	editstr = "编辑内容";
	isRead = "readonly='true'";
	
	if(request.getMethod().equalsIgnoreCase("post")){
		sub1 = request.getParameter("submitedit");
		sub2 = request.getParameter("submitcomment");
		sub3 = request.getParameter("delete");
		if(sub1 != null&&isLogin.equals("true")){
			if(sub1.equals("编辑内容")){
				fontstyle = "style='font-style:italic'";
				editstr = "修改完成";
				isRead = "";
			}
			else if(sub1.equals("修改完成")){
				moviename = request.getParameter("name");
				moviedirector = request.getParameter("director");
				moviestarring = request.getParameter("starring");
				movieyear = request.getParameter("year");
				movieclass = request.getParameter("classes");
				movieinfo = request.getParameter("info");
				updateMovie(movieid, "name", moviename);
				updateMovie(movieid, "director", moviedirector);
				updateMovie(movieid, "starring", moviestarring);
				updateMovie(movieid, "year", movieyear);
				updateMovie(movieid, "classes", movieclass);
				updateMovie(movieid, "info", movieinfo);
				fontstyle = "";
				editstr = "编辑内容";
				isRead = "readonly='true'";
			}
		}
	/*	else if(sub1 != null&&isLogin.equals("false"))
		{
			out.println("<script>window.alert('请先登录账号');window.history.go(-1);</script>");
		}*/
		if(sub2 != null&&isLogin.equals("true"))
		{
			if(sub2.equals("提交")){
				moviecomment = request.getParameter("new-comment");
				Comment comment = new Comment(getmovieuserid, movieid, moviecomment);
				insertComment(comment);
				moviecomment = "";
				commentlist = queryComment(movieid);
			}
		}
	/*	else if(sub2 != null&&isLogin.equals("false"))
		{
			out.println("<script>window.alert('请先登录账号');window.history.go(-1);</script>");
		}*/
		if(sub3 != null){
			deletecommentid = request.getParameter("commentid");
			deleteComment(Integer.parseInt(deletecommentid));
			commentlist = queryComment(movieid);
		}
	}
%>
<!DOCTYPE HTML>
<html>
<head>
  <title>详情</title>
  <link rel="stylesheet" type="text/css" href="public/css/index.css">
  <link rel="stylesheet" type="text/css" href="public/css/reset.css">
  <link rel="stylesheet" type="text/css" href="public/css/details.css">
  <script type="text/javascript" src="public/js/details.js"></script>
  <script>
     var comment = document.getElementById('my-comment');
     function to_comment() {
   	  comment.style.height = '80px';
	  sub_comment.style.opacity = '1';
     }
  </script>
</head>
<body>
  <div class="bg-item bg-blur" style="background-image:url(<%= moviepost%>)"></div>
  <!-- 向js文件传递信息 -->
  <input type = "hidden" id="isLogin" value="<%= isLogin%>"> 
  <!--导航栏-->
  <div class="nav-wrapper">
    <div class="nav-content">
      <img class="logo" src="public/image/hdmovie_32.png">
      <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="https://github.com/Caiyeee/web_proj">关于我们</a></li>
      </ul>
      <div class="login_register">
        <%if(session.getAttribute("username") == null) {%>
          <span class="btn_login"><a id="btn_login">登录</a></span>
          <span style="color: white">&nbsp;|</span><span class="btn_regis"><a id="btn_regis">注册</a></span>
        <%}else {%>
          <span class="welcome" style="color: white">欢迎，</span><span style="color: white"><%=session.getAttribute("username")%></span>
          <span style="color: white">&nbsp;|</span><span class="btn_logout"><a id="btn_logout" href="logout.jsp?mid=<%=getmovieid %>">登出</a></span>
        <%}%>
      </div>
    </div>
  </div>
  
  <div class="content-wrapper" style="flex: 1">
	  <!-- 影片详情 -->
	  <form action="details.jsp?mid=<%= getmovieid%>" method="post" class="movie-form">
	    <div class="detail clearfx">
	      <div class="left clearfx">
	         <div id="moviepic" class="movie-pic"><img class="poster" src=<%= moviepost%>></div>
	      </div>
	      <div class="right">
	        <p class="movie-name"><input id="moviename" name="name" value=<%= moviename %>></p>
	        <%if(session.getAttribute("username") != null){ %>
	  	      <input id="shortcomment" type="submit" value=<%= editstr%> name="submitedit">
	  	      <span><img id="editicon" src="public/image/editicon.png"></span>
	  	    <%}%>
	  	    <div id="movieinfo" class="movie-info">
	  	      <div class="info-item">
	  	        <strong>导演：</strong> <input id="director" type="text" value=<%= moviedirector%> <%= isRead%> <%=fontstyle%> name="director">
	  	      </div>
	  	  	  <div class="info-item">
	  	  	    <strong>主演：</strong> <input id="starring" type="text" value=<%= moviestarring%> <%= isRead%> <%=fontstyle%> name="starring">
	  	  	  </div>
	  	  	  <div class="info-item">
	  	  	    <strong>上映年份：</strong> <input id="year" type="text" value=<%= movieyear%> <%= isRead%> <%=fontstyle%> name="year">
	  	  	  </div>
	  	  	  <div class="info-item">
	  	  	    <strong>类别：</strong> <input id="movieclass" type="text" value=<%= movieclass%> <%= isRead%> <%=fontstyle%> name="classes">
	  	  	  </div>
	  	  	  <div class="info-item short-content">

	  	  	    <strong id="plot">剧情简介:</strong><textarea id="movieplot" type="text" <%= isRead%> <%=fontstyle%> name=info><%= movieinfo%></textarea>
	  	  	  </div>
	  	    </div>
	      </div>
	   	</div>
	   	<div class="comment">
	   	  <%if(session.getAttribute("username") == null){ %>
	   	     <div class="awake-to-login">
	   	        <i><img alt="" src="public/image/user_no.png"></i>
	   	        <span>目前您尚未登录，请<a href="#" id="awake_login">登录</a>或<a href="#" id="awake_regist">注册</a>后进行评论</span>
	   	     </div>
	   	     <%}else{ %>
				  <div class="newcomment">
				  	 <span><img alt="" src="public/image/user_no.png"></span>
				     <textarea type="text" name="new-comment" id="my-comment" placeholder="发表你的评论" class="commit-text" onclick="to_comment()"><%= moviecomment%></textarea><br>
				     <input id="comment-sub" type="submit" value="提交" name="submitcomment" class="sub-commit">
				  </div>
			 <%}%>
		  <div class="somecomments cont">
	  		<div id="comtitle" style="margin-bottom: 25px"><%= moviename%>的短评</div>
	  		<%String getcomments="";
	  		   String isShowDelete = "";
	  		 if(commentlist != null){
	  			for(int i=0; i<commentlist.size(); i++){
	  				getcomments="";
	  				Map<String,String> commentmap = commentlist.get(i);
	  				if(String.valueOf(commentmap.get("user_id")).equals(String.valueOf(getmovieuserid))){
	  					isShowDelete = "";	
	  				}else{
	  					isShowDelete = "style='display:none'";
	  				}
	  				%>
	  				<div class="comment-wrapper">
		  				<div id="commentusername">
		  				  <i><img alt="" src="public/image/user_center.png" width="30" height="30"></i>
		  				  <span><%= queryNameById(String.valueOf(commentmap.get("user_id")))%> </span>
		  				  <form action="details.jsp?mid=<%= getmovieid%>&commentid=<%= String.valueOf(commentmap.get("id"))%>" method="post">
		  				    <input id="deletecomment" type="submit" value="删除" name="delete" <%= isShowDelete%>>
		  				  </form>
		  				</div>
		  				<div id="usercomment"><%= commentmap.get("content")%></div>	  				
	  				</div>
	  				<% }%>
	  		<% }else {getcomments="null";} %>
	     </div> 
	    </div>
	  
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
  <form class="ui-dialog " id="dialog-Login" method="post" action="checkLogin.jsp?mid=<%=getmovieid %>" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      登录通行证
      <a class="ui-dialog-closebutton"  id="close_login"></a>
    </div>
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
  <form class="ui-dialog " id="dialog-register" method="post" action="checkRegist.jsp?mid=<%=getmovieid %>" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      注册账号
      <a class="ui-dialog-closebutton" id="close_regist"></a>
    </div>
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
  <script type="text/javascript" src="public/js/details.js"></script>
  </form>
</body>
</html>

<%@ include file="DB.jsp" %>