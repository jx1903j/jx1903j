<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/style.css">
<script src="<%=basePath%>admin/js/jquery.min.js"></script>
<%--<script type="text/javascript">--%>
<%--$(document).ready(function(){--%>
<%--	  $("#btn_login").click(function(){--%>
<%--		  var acc = $("#acc").val();--%>
<%--			var pwd = $("#pwd").val();--%>
<%--			if (acc == '' || pwd == '') {--%>
<%--				alert("用户名和密码不能为空");--%>
<%--				return false;--%>
<%--			}--%>
<%--		  $.ajax({--%>
<%--			  url:"<%=path%>LoginServlet",--%>
<%--				type : "post",--%>
<%--				data : $("#myform").serialize(),--%>
<%--				success : function(redata) {--%>
<%--					var obj = eval('(' + redata + ')');--%>
<%--					var msg = "";--%>

<%--					if (obj == "0") {--%>
<%--						msg = "登录成功";--%>
<%--						alert(msg);--%>
<%--						location.href = "<%=path%>MainServlet?mian=index";--%>
<%--					} else if(obj=="1") {--%>
<%--							msg = "用户名或密码有误";--%>
<%--							alert(msg);--%>
<%--							document.getElementsByTagName("img")[0].src = "VerifyCodeServlet?time="--%>
<%--								+ new Date().getTime();--%>
<%--					}else{--%>
<%--						alert("验证码有误");--%>
<%--						document.getElementsByTagName("img")[0].src = "VerifyCodeServlet?time="--%>
<%--							+ new Date().getTime();--%>
<%--					}--%>
<%--					},--%>
<%--				error : function() {--%>

<%--				}--%>

<%--			});--%>

<%--		});--%>

<%--	});--%>
<%--</script>--%>
</head>

<body>
	<div class="top">Login</div>
	<div class="main">
		<form action="<%=basePath%>ulogin/login!Login.action" method="post" id="myform">
			<div id="d_acc">
				用户名： <input id="acc" name="user.uname" class="inp" type="text" />
			</div>
			<div id="d_pwd">
				密 &nbsp;码： <input id="pwd" name="user.upwd" class="inp" type="password"
					value="" />
			</div>

<%--			<div id="yz">--%>
<%--				验证码： <input id="yzm" name="yzm" class="inp1" type="text" /><img--%>
<%--					src="VerifyCodeServlet" id="btn"><a id="btn1" href="#">看不清，换一张</a>--%>
<%--			</div>--%>

			<div id="sub">
				<input type="submit" id="btn_login" name="btn_login" value="登录" />

				<input type="reset" value="重置" /> <br /> <br /> <br /> <br />
			</div>
		</form>


	</div>
<%--	<script type="text/javascript">--%>
<%--		$(function() {--%>
<%--			$("#btn,#btn1")--%>
<%--					.click(--%>
<%--							function() {--%>
<%--								document.getElementsByTagName("img")[0].src = "VerifyCodeServlet?time="--%>
<%--										+ new Date().getTime();--%>
<%--							})--%>
<%--		})--%>
<%--	</script>--%>
</body>

</html>