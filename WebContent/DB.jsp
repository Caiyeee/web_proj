<%@ page language="java"  import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%
	boolean con = connect();
	//插入测试.插入失败都返回-1，电影和用户如果存在一样的，不插入，返回0
//	User user = new User("啊烨","叶子");
//	Comment com = new Comment(12,123,"comments");
//	Movie movie = new Movie("寻梦环游","导演","演员",2017,"简介","图片url","分类");
//	int a = insertUser(user);
//	int b = insertMovie(movie);
/*	int c = insertComment(com);
	//删除和更新测试
	int d = deleteComment(13);
	int e = updateMovie(2,"pic","图片url");
	//查询用户，返回0代表不存在，否则返回其密码，null则是查询失败
		String s = queryUser("123");
	//查询测试(按照这个模板就可以拿到数据填进列表)
*/ /* List<Map<String,String>> list = queryMovie("2",2);
	String query="*";
	if(list != null){
//		for(int i=0; i<list.size(); i++){
			Map<String,String> map = list.get(0);
			query += map.get("id") + map.get("name")+"\n";
//		}
	}else {query="null";}*/
	
%>
<%!
	String test ="test";
	Connection con;
	int userId=0, movieId=0, commentId=0;

	//插入电影
	public int insertMovie(Movie movie){
		try{
			Statement stmt=con.createStatement();
			String sql = "select * from movies where name=\'" + movie.getName() + "\' and director=\'" + movie.getDirector() + "\'";
			ResultSet exit = stmt.executeQuery(sql);
			if(exit.next()){
				return 0;//已经存在名字和导演都一样的电影了
			}
			sql = "insert into movies(year,name,director,starring,pic,classes,info) values(" 
				+ String.valueOf(movie.getYear()) + ",\'" + movie.getName() + "\',\'" + movie.getDirector() + "\',\'" 
				+ movie.getStarring() + "\',\'"  + movie.getPic() + "\',\'" + movie.getClasses() + "\',\'" + movie.getInfo() + "\')";		
			int res = stmt.executeUpdate(sql);
			int id = 0;//取其插入的id
			if(res>0){
				ResultSet rs = stmt.executeQuery("select * from movies where name=\'" + movie.getName() + "\'");
				boolean b = rs.last();
				if(b) id = rs.getInt("id");
			}
			stmt.close();
			return id;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return -1;
		}
	}
	//插入用户
	public int insertUser(User user){
		try{
			Statement stmt=con.createStatement();
			String sql = "select * from users where name=\'" + user.getName() + "\'";
			ResultSet exit = stmt.executeQuery(sql);//如果存在该用户名
			if(exit.next()){
				return 0;
			}
			sql = "insert into users(name,password) values('" + user.getName() + "\',\'" + user.getPsw() + "\')";
			int res = stmt.executeUpdate(sql);
			int id = 0;//取其插入的id
			if(res>0){
				ResultSet rs = stmt.executeQuery("select * from users where name=\'" + user.getName() + "\'");
				boolean b = rs.last();
				if(b) id = rs.getInt("id");
			}
			stmt.close();
			return id;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return -1;
		}
	}
	//插入评论
	public int insertComment(Comment comment){
		try{
			Statement stmt=con.createStatement();
			String sql = "insert into comments(movie_id,user_id,content) values(" + String.valueOf(comment.getMovie_id())
				+ "," + String.valueOf(comment.getUser_id()) + ",\'" + comment.getContent() + "\')";
			int res = stmt.executeUpdate(sql);
			int id = 0;//取其插入的id
			if(res>0){
				ResultSet rs = stmt.executeQuery("select * from comments where user_id=" + String.valueOf(comment.getUser_id()));
				boolean b = rs.last();
				if(b) id = rs.getInt("id");
			}
			stmt.close();
			return id;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return -1;
		}
	}
	//删除评论
	public int deleteComment(int id){
		try{
			Statement stmt=con.createStatement();
			String sql = "delete from comments where id=" + String.valueOf(id);
			int res = stmt.executeUpdate(sql);
			stmt.close();
			return res;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return 0;
		}
	}
	//修改电影
	public int updateMovie(int id, String attr, String s){
		try{
			Statement stmt=con.createStatement();
			String sql = "update movies set " + attr + "=\'" + s + "\'where id=" + String.valueOf(id);
			int res = stmt.executeUpdate(sql);
			stmt.close();
			return res;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return 0;
		}
	}
	//查询电影
	public List<Map<String,String>> queryMovie(String s, int mode){
		try{
			Statement stmt=con.createStatement();
			String sql="";
			if(mode == 1){ //除了pic和分类和id外的其他属性都可查)
				sql = "select * from movies where name like \'%" + s + "%\' or starring like \'%" + s 
						+ "%\' or director like \'%" + s + "%\' or year like \'%" + s + "%\' or info like \'%" + s + "%\'";
			} else if(mode == 2){//按id查询
				sql = "select * from movies where id=" + s;
			}
			ResultSet rs = stmt.executeQuery(sql);
			List<Map<String,String>> list = resultsetToList(rs);	
			stmt.close();
			return list;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	//按分类查询电影
	public List<Map<String,String>> movieClass(String classes){
		try{
			Statement stmt=con.createStatement();
			String sql = "";
			if(classes.equals("全部")){
				sql = "select * from movies";
			} else {
				sql = "select * from movies where classes=\'" + classes + "\'";
			}
			ResultSet rs = stmt.executeQuery(sql);
			List<Map<String,String>> list = resultsetToList(rs);
			stmt.close();
			return list;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	//查询评论（用于显示）
	public List<Map<String,String>> queryComment(int movie_id){
		try{
			Statement stmt=con.createStatement();
			String sql = "select * from comments where movie_id=" + String.valueOf(movie_id);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				rs.previous();
				List<Map<String,String>> list = resultsetToList(rs);
				stmt.close();
				return list;
			} else {
				stmt.close();
				return null;
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	//查询用户
	public String queryUser(String name){
		try{
			Statement stmt=con.createStatement();
			String sql = "select * from users where name=\'" + name + "\'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				return rs.getString("password");		
			} else {
				stmt.close();
				return "0";
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	//通过用户id查询用户名
	public String queryNameById(String user_id){
		try{
			Statement stmt=con.createStatement();
			String sql = "select * from users where id=" + user_id;
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				return rs.getString("name");
			} else {
				stmt.close();
				return null;
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	//把ResultSet转化为list，list中的条目是map<string,string>
	public static List<Map<String,String>> resultsetToList(ResultSet rs) throws java.sql.SQLException {
		if(rs == null)	return null;
		ResultSetMetaData md = rs.getMetaData(); //得到rs的结果信息，比如字段数、字段名等
		int columnCount = md.getColumnCount();   //返回次ResultSet对象中的列数
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Map<String,String> rowData = new HashMap<String,String>();
		while(rs.next()){
			rowData = new HashMap<String,String>(columnCount);
			for(int i=1; i<=columnCount; i++){
				rowData.put(md.getColumnName(i),String.valueOf(rs.getObject(i)));
			}
			list.add(rowData);
		}
		return list;
	}
	//用户类
	public class User{
		private String name;
		private String password;
		private int id;
		public User(String name, String password){
			this.name = name;
			this.password = password;
		}
		int getId(){ return this.id; }
		String getName(){ return this.name; }
		String getPsw(){ return this.password; }
		void setName(String name){ this.name = name; }
		void setPsw(String psw){ this.password = psw; }
	}
	//电影类
	public class Movie{
		private int id;
		private String name;
		private String starring;
		private int year;
		private String director;
		private String info;
		private String pic;
		private String classes;
		public Movie(String name,String director,String starring,int year,String info,String pic,String classes){
			this.name = name;
			this.director = director;
			this.starring = starring;
			this.year = year;
			this.info = info;
			this.pic = pic;
			this.classes = classes;
		}
		int getId(){return this.id;}
		int getYear(){return this.year;}
		String getName(){return this.name;}
		String getStarring(){return this.starring;}
		String getDirector(){return this.director;}
		String getInfo(){return this.info;}
		String getPic(){return this.pic;}
		String getClasses(){return this.classes;}
		void setYear(int year){this.year = year;}
		void setName(String name){this.name = name;}
		void setDirector(String director){this.director = director;}
		void setStarring(String starring){this.starring = starring;}
		void setInfo(String info){this.info = info;}
		void setPic(String pic){this.pic = pic;}
		void setClasses(String classes){this.classes = classes;}
	}
	//评论类
	public class Comment{
		private int id;
		private int movie_id;
		private int user_id;
		private String content;
		public Comment(int user_id, int movie_id, String content){
			this.movie_id = movie_id;
			this.content = content;
			this.user_id = user_id;
		}
		int getId(){return this.id;}
		int getMovie_id(){return this.movie_id;}
		int getUser_id(){return this.user_id;}
		String getContent(){return this.content;}
		void setMovie_id(int id){this.movie_id = id;}
		void setContent(String content){this.content = content;}
		void setUser_id(int id){this.user_id = id;}
	}
	//建立连接
	public boolean connect(){
		String connectString = "jdbc:mysql://172.18.187.234:53306/15352006_db"
				+ "?autoReconnect=true&useUnicode=true"
				+ "&characterEncoding=UTF-8"; 
		try{
		  	Class.forName("com.mysql.jdbc.Driver");
		  	con = DriverManager.getConnection(connectString, "user", "123");
		  	return true;
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	} 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>database</title>
</head>
<body>
</body>
</html>