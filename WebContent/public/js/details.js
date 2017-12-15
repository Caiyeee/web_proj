  // 登录注册框弹出
  function g(id){return document.getElementById(id);}
  var close_login = g('close_login');
  var close_regist = g('close_regist');
  var login = g('btn_login');
  var register = g('btn_regis');
  var jump_to_regist = g('jump_to_regist');
  var jump_to_login = g('jump_to_login');

  login.onclick = function () {
    g('dialog-Login').style.display = 'block';
    g('mask').style.display = 'block';
  }
  register.onclick = function() {
    g('dialog-register').style.display = 'block';
    g('mask').style.display = 'block';
  }
  close_login.onclick = function() {
    g('dialog-Login').style.display = 'none';
    g('mask').style.display = 'none';
  }
  close_regist.onclick = function() {
    g('dialog-register').style.display = 'none';
    g('mask').style.display = 'none';
  }
  jump_to_regist.onclick = function() {
    g('dialog-Login').style.display = 'none';
    g('dialog-register').style.display = 'block';
  }
  jump_to_login.onclick = function() {
    g('dialog-register').style.display = 'none';
    g('dialog-Login').style.display = 'block';
  }

  //编辑词条
  var director = g('director');
  var starring = g('starring');
  var year = g('year');
  var movieclass = g('movieclass');
  var movieplot = g('movieplot');
  var editinfo = g('shortcomment');
  var tag = g('tag');
  editinfo.onclick = function(){
	  if(tag.value == "true"&&editinfo.innerHTML == "&nbsp;编辑内容"){
		  editinfo.innerHTML = "&nbsp;修改完成";
		  director.readOnly = false;
		  starring.readOnly = false;
		  year.readOnly = false;
		  movieclass.readOnly = false;
		  movieplot.readOnly = false;
	  }
	  else if(tag.value == "true"&&editinfo.innerHTML == "&nbsp;修改完成"){
		  editinfo.innerHTML = "&nbsp;编辑内容";
		  director.readOnly = true;
		  starring.readOnly = true;
		  year.readOnly = true;
		  movieclass.readOnly=true;
		  movieplot.readOnly = true;
	  }
  }
