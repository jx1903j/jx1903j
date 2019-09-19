<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css"  media="all">

</head>
<body>
<br>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="demoTable" align="center">

                    <div class="layui-inline">
                        <input id="ftime" name="ftime" type="date" class="layui-input" autocomplete="off">
                    </div>
                    <div class="layui-inline">
                        <input id="ltime" name="ltime" type="date" class="layui-input" autocomplete="off"></div>
                    <div class="layui-inline ">
                        <input type="text" id="uname" name="uname" placeholder="请输入用户名" autocomplete="off"
                               class="layui-input"  ></div>
                    <div class="layui-inline">
                        <button class="layui-btn" data-type="reload">查询</button>
                    </div>

                </div>
                <div class="layui-card-body" align="center" >
                    <table class="layui-table" lay-filter="test" id="test" align="center">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-xs " lay-event="useEna">启用</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="useDis">禁用</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="useResetPwd">重置密码</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="useDel">删除</a>
    <a title="编辑" lay-event="edit"  >
        <i class="layui-icon">&#xe642;</i>
    </a>
</script>

<script src="<%=basePath%>layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test',
            url:'<%=basePath%>adminlist/userinfo4.action',
            parseData:function (res) {
                console.log("返回值" + res);
                console.log("状态码" + res.code);
            }
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                ,groups: 1 //只显示 1 个连续页码
                ,first: false //不显示首页
                ,last: false //不显示尾页

            }
            ,cols: [[
                {field:'uname', minWidth: 80, title: '用户名', sort: true}
                ,{field:'phone', minWidth: 80, title: '电话'}
                ,{field:'sex', minWidth: 80, title: '性别', sort: true}
                ,{field:'age', minWidth: 80, title: '年龄'}
                ,{field:'ztname', title: '状态', minWidth: 80}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:360}

            ]]

        });

        table.on('tool(test)', function(obj) {
            var data = obj.data;

            if (obj.event === 'useDel') {
                layer.confirm('确定删除？ID:'+data.userid, function (index) {
                    layer.close(index);
                });
            } else if (obj.event === 'useEna') {
                layer.confirm('确定启用？', function (index) {
                    layer.close(index);
                });
            }else if(obj.event==="useDis"){
                layer.confirm('确定禁用？', function (index) {

                    layer.close(index);
                });
            } else if(obj.event==="useResetPwd"){
                layer.confirm('确定重置？', function (index) {
                    layer.close(index);
                });
            }else if(obj.event==="edit")
            {
                layer.open({
                    type: 1
                    ,title: "用户修改" //不显示标题栏
                    ,closeBtn: false
                    ,area: '600px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['修改', '返回']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><div class="layui-form-item">\n' +
                        '                        <label for="L_email" class="layui-form-label">\n' +
                        '                            <span class="x-red">*</span>用户名</label>\n' +
                        '                        <div class="layui-input-inline">\n' +
                        '                            <input type="text" id="L_email" name="email" required="" lay-verify="email" autocomplete="off" class="layui-input" value="'+data.uname+'"></div>\n' +
                        '                        <div class="layui-form-mid layui-word-aux">\n' +
                        '                            <span class="x-red">*</span>将会成为您唯一的登入名</div></div>\n' +
                        '                    <div class="layui-form-item">\n' +
                        '                        <label for="L_username" class="layui-form-label">\n' +
                        '                            <span class="x-red">*</span>手机</label>\n' +
                        '                        <div class="layui-input-inline">\n' +
                        '                            <input type="text" id="L_username" name="username" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>\n' +
                        '                    </div>\n' +
                        '                    <div class="layui-form-item">\n' +
                        '                        <label for="L_pass" class="layui-form-label">\n' +
                        '                            <span class="x-red">*</span>密码</label>\n' +
                        '                        <div class="layui-input-inline">\n' +
                        '                            <input type="password" id="L_pass" name="pass" required="" lay-verify="pass" autocomplete="off" class="layui-input"></div>\n' +
                        '                        <div class="layui-form-mid layui-word-aux">6到16个字符</div></div>\n' +
                        '                    <div class="layui-form-item">\n' +
                        '                        <label for="L_repass" class="layui-form-label">\n' +
                        '                            <span class="x-red">*</span>确认密码</label>\n' +
                        '                        <div class="layui-input-inline">\n' +
                        '                            <input type="password" id="L_repass" name="repass" required="" lay-verify="repass" autocomplete="off" class="layui-input"></div>\n' +
                        '                    </div>' +
                        '</div>'
                    ,success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: 'http://www.layui.com/'
                            ,target: '_blank'
                        });
                    }
                });
            }
        });



    //触发查询按钮
    var $ = layui.$, active = {
        reload: function(){
            var uname = $('#uname');
            var ftime=$('#ftime');
            var ltime=$('#ltime');
            //执行重载
            table.reload('test', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    uname: uname.val(),
                    ftime:ftime.val(),
                    ltime:ltime.val(),
                }
            }, 'data');
        }
    };



    $('.demoTable .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    })
    });
</script>

</html>