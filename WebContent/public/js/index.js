var oBody = document.getElementsByTagName("body")[0];
var aBanner = document.getElementsByClassName("banner");
var aSpan = document.getElementsByClassName("tab")[0].getElementsByTagName("span");
var oNext = document.getElementsByClassName("next")[0];
var Oprev = document.getElementsByClassName("prev")[0];
var Oon = document.getElementsByClassName("on")[0];
//初始化让第一张图片显示，和第一个原点显示
aBanner[0].style.opacity = "1";
aSpan[0].className = "on";

var num = 0;
for(var i = 0;i < aSpan.length;i++){
aSpan[i].index = i;
aSpan[i].onclick = function(){  //点击小圆点图片相对应的进行切换
for(var j = 0 ;j < aSpan.length; j++){
  num = this.index;
  aSpan[j].className = "";
  aBanner[j].style.opacity = "0";
}
aSpan[num].className = "on";
aBanner[num].style.opacity = "1";
}
oNext.onclick = function(){//按下图片切换到后一张
  for(var j = 0 ;j < aSpan.length; j++){
  if(aSpan[j].className == "on"){
      aSpan[j].className = "";
      aBanner[j].style.opacity = "0";
      j++;
      num++;
      if(j > 4){
      j = 0;
  }
      aSpan[j].className = "on";
  aBanner[j].style.opacity = "1";

  }
}
}

  Oprev.onclick = function(){  //按下图片切换到前一张
  for(var j = 0 ;j < aSpan.length; j++){
      if(aSpan[j].className == "on"){
          aSpan[j].className = "";
          aBanner[j].style.opacity = "0";
          j--;
          num--;
          if(j < 0){
          j = 4;
      }
          aSpan[j].className = "on";
  aBanner[j].style.opacity = "1";

  }
}
}
}

function Time(){/*设置定时器运行的函数*/
  num++;
  if(num < 5){
      for(var j = 0 ;j < aSpan.length; j++){
      aSpan[j].className = "";
      aBanner[j].style.opacity = "0";
  }
  aSpan[num].className = "on";
  aBanner[num].style.opacity = "1";
  }else {
      num = -1;
  }
}
clearInterval(timer);
var timer = setInterval(Time(),2000);/*调用定时器*/

oBody.onmouseover = function(){/*鼠标引入，清除定时器，轮播图停止*/
    clearInterval(timer);
};
oBody.onmouseout = function(){/*鼠标移出，重新调用定时器，轮播图开始*/
    clearInterval(timer);
     timer = setInterval("Time()",2000);
};




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

//注册框判断
  var username = g('regis_username');
  var password = g('regis_password');
  var register_form = g('dialog-register');
  var to_register = g('to_register');
  var error = g('error');

  to_register.onclick = function() {
    if(username.value == "" || password.value == "" || password.value.length < 2) {
       error.style.display = "block";
       return false;
    }
  }

//登录框判断
  var login_username = g('login_username');
  var login_password = g('login_password');
  var login_register_form = g('dialog-Login');
  var to_login = g('to_login');
  var error1 = g('error1');

  to_login.onclick = function() {
    if(login_password.value.length < 2) {
       error1.style.display = "block";
       return false;
    }
  }


