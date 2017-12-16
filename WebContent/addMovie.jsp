<%@ page language="java"  contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*,java.util.*,org.apache.commons.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ include file = "DB.jsp" %>
<%
  request.setCharacterEncoding("utf-8");

	Movie newMovie = new Movie();
	if(request.getMethod().equalsIgnoreCase("post")){	
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = upload.parseRequest(request);		
			for(int i=0; i<items.size(); i++) {//表单数据
				FileItem fi = (FileItem) items.get(i);
				if(fi.isFormField()){
					String attr = fi.getFieldName();
					if(attr.equals("movieName"))
						newMovie.setName(fi.getString("utf-8"));
					else if(attr.equals("director"))
						newMovie.setDirector(fi.getString("utf-8"));
					else if(attr.equals("actor"))
						newMovie.setStarring(fi.getString("utf-8"));
					else if(attr.equals("classes"))
						newMovie.setClasses(fi.getString("utf-8"));
					else if(attr.equals("descri"))
						newMovie.setInfo(fi.getString("utf-8"));
					else if(attr.equals("year"))
						newMovie.setYear(Integer.parseInt(fi.getString("utf-8")));
				} else {//文件
					DiskFileItem dfi = (DiskFileItem) fi;
					if(!dfi.getName().trim().equals("")){
						String fileName = application.getRealPath("/public/image")
								+ System.getProperty("file.separator")
								+ FilenameUtils.getName(dfi.getName());
						dfi.write(new File(fileName));
						newMovie.setPic("public/image/"+FilenameUtils.getName(dfi.getName()));
					}
				}
			}
			int movieid = insertMovie(newMovie);
			response.sendRedirect("details.jsp?mid="+String.valueOf(movieid));
		}
	}
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
        <span class="btn_login"><a id="btn_login">欢迎，<%=session.getAttribute("username") %></a></span>
        <span style="color: white">&nbsp;|</span><span class="btn_regis"><a id="btn_logout" href="logout.jsp">登出</a></span>
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
    <form class="add-detail" action="addMovie.jsp" method="post" enctype="multipart/form-data">
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


  <script type="text/javascript" src="public/js/index.js"></script>
</body>
</html>
