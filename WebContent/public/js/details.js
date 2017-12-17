// 登录注册框弹出
  function g(id){return document.getElementById(id);}
  var close_login = g('close_login');
  var close_regist = g('close_regist');
  var login = g('btn_login');
  var register = g('btn_regis');
  var jump_to_regist = g('jump_to_regist');
  var jump_to_login = g('jump_to_login');
  var awake_to_login = g('awake_login');
  var awake_to_regist= g('awake_regist');
  var comment = g('my-comment');
  var sub_comment = g('comment-sub');
 
  
  awake_to_login.onclick = function() {
    g('dialog-Login').style.display = 'block';
    g('mask').style.display = 'block';
  }
  awake_to_regist.onclick = function() {
    g('dialog-register').style.display = 'block';
    g('mask').style.display = 'block';	  
  }

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
  
  comment.onclick = function() {
	  comment.style.height = '80px';
	  sub_comment.style.opacity = '1';
  }
