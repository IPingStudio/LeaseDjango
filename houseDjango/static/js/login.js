// JavaScript Document

//Created by haoran on 2020.09.03

function login() {
	var userName = document.getElementById("userName");
	var passWord = document.getElementById("passWord");
	
	if(userName.value == ""){
		alert("请输入用户名！");
	}else if(passWord.value == ""){
		alert("请输入密码！");
	}else if(userName.value == "admin" && passWord.value == "123456"){
		window.location.href = "welcome.html";
	}else{
		alert("用户名密码错误！");
	}
}
