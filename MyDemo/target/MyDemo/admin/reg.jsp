<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath%>admin/js/jquery.min.js">
</script>

<script type="text/javascript">
$(document).ready(function(){
	  $("#username").blur(function(){
	      var name=$("#username").val();
		  $.ajax({
			  url:"<%=basePath%>reg/ureg!Regname.action",
				type : "post",
				data : {name:name},
			  	dataType:"json",
				success : function(data) {
					if (data==1){
					    $("#txt").html("恭喜此用户名可用").css("color","red");
                    }else{
                        $("#txt").html("此用户名已被使用").css("color","red");
                    }
				},
				error : function() {

				}
			});

		});

	});

</script>
<html>
<head>
<title>添加系统用户</title>
<style type="text/css">
font {
	color: #000;
}
</style>
<script>
	function tit() {
		var title = $("#title").val();
		if (title == 2) {
			document.getElementById("linyu").style.display = 'block';
			$("#lingyu").val("1");			
		} else {
			document.getElementById("linyu").style.display = 'none';
			$("#lingyu").val("0");
		}
	}
	function reg() {

		var username = $("#username").val();
		var upwd = $("#upwd").val();
		var phone=$("#phone").val();
		var age=$("#age").val();
		var sex=$("input[name='user.sex']:checked").val();
		var pwd = $("#pwd").val();
		var uPattern = /^[a-zA-Z0-9_-]{1,16}$/;
		 if (uPattern.test(username) != true) {
			alert("账号格式不正确");
			return false;
		} else if (upwd == "" || upwd.length == 0) {
			alert("密码不能为空");
			return false;
		} else if (pwd != upwd) {
			alert("输入的密码不一致");
			return false;
		}
        $.ajax({
            url:"<%=basePath%>reg/reg!Reg.action",
            type : "post",
            data : {name:username,pwd:upwd,phone:phone,age:age,sex:sex},
            dataType:"json",
            success : function(data) {

                if (data==1){
                    alert("注册成功！");
                    location.href = "<%=basePath%>reg/regs!regsu.action";
                }else{
                    alert("注册失败")
                    location.href = "<%=basePath%>reg/regs!regsu.action";
                }
            },
            error : function() {

            }
        });

	}
</script>
<style>
.bgcolor {
	background-color: #0FF;
}

.bgcolor1 {
	background-color: #9F9;
}

.txt {
	border: #F00 1px solid;
	height: 30px;
}

.txt2 {
	border: #0F0 1px solid;
	height: 20px;
}
</style>

</head>
<body>
	<div style="text-align: center;">
		<span><font size="+6">新增用户</font></span>
	</div>
	<hr size="25" style="background-color: #0FF" />

	<form id="myfrom" method="post"  action="<%=basePath%>reg/reg!Reg.action"  >
		<table width="60%" align="center">
			<tr onMouseOver="this.className='bgcolor'"
				onMouseOut="this.className='bgcolor1'">
				<td width="25%" align="right"><font>账号：</font></td>
				<td width="35%"><input type="text" name="user.uname" id="username"><font
					id="txt"></font></td>
			</tr>
			<tr onMouseOver="this.className='bgcolor'"
				onMouseOut="this.className='bgcolor1'">
				<td align="right"><font>密&nbsp;&nbsp;码：</font></td>
				<td><input type="password" name="user.upwd" id="upwd"></td>

			</tr>

			<tr onMouseOver="this.className='bgcolor'"
				onMouseOut="this.className='bgcolor1'">
				<td align="right"><font>再次输入密码：</font></td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr onMouseOver="this.className='bgcolor'"
				onMouseOut="this.className='bgcolor1'">
				<td align="right"><font>手机号：</font></td>
				<td><input type="text" name="user.phone" id="phone"></td>
			</tr>
            <tr onMouseOver="this.className='bgcolor'"
                onMouseOut="this.className='bgcolor1'">
                <td align="right"><font>年龄：</font></td>
                <td><input type="text" name="user.age" id="age"></td>
            </tr>

			<tr onMouseOver="this.className='bgcolor'"
				onMouseOut="this.className='bgcolor1'">
				<td align="right">性别:</td>
				<td><p>
				  <label>
				    <input name="user.sex" type="radio" id="sex_0" value="男" checked="CHECKED">
				    男</label>
				  
				  <label>
				    <input type="radio" name="user.sex" value="女" id="sex_1">
				    女</label>
				  <br>
			    </p></td>
			</tr>
			<tr onMouseOver="this.className='bgcolor'"
				onMouseOut="this.className='bgcolor1'">
				<td align="right">&nbsp;</td>
				<td>
				<input onClick="reg()" type="button" value="注册">
				<input type="reset" name="reset" value="重填">
				</td>
			</tr>
			
		</table>

		<br /> <br /> <br /> <br /> <br /> <br />
	</form>

</body>
</html>