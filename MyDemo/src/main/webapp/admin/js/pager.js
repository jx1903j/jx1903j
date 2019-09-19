/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// var totalPage;
// var currentPage;
// var userlist;
//
// //初始化请求--将当前页和总页面初始化 和 list
// $(document).ready(function(){
//
//     $.get('userli/Init.action','',function(results){
//         $.each(results, function(key, val) {
//             if(key === "current")
//                 currentPage = results[key];
//             else if(key === "total")
//                 totalPage = results[key];
//             else if(key == "list"){
//                 userlist=val;
//             }
//         });
//         currentPage = parseInt(currentPage);
//         totalPage = parseInt(totalPage);
//         $("#current").text(currentPage);
//         $("#total").text(totalPage);
//         getUser(userlist);
//
//         //console.log(currentPage);
//         //console.log(totalPage);
//     });
// });
//
// //上一页
// $(document).ready(function(){
//     $('#prePage').click(function(){
//         if(currentPage == 1)
//             alert("已至首页");
//         else{
//             currentPage = currentPage-1;
//             var need=currentPage;
//
//             $.get('userli/Pager.action','need='+need,function(result){
//                 userlist = result['userList'];
//                 getUser(userlist);
//                 $('#current').text(need);
//             });
//             }
//     });
// });
// //下一页
// $(document).ready(function(){
//     $('#nextPage').click(function(){
//         if(currentPage == totalPage)
//             alert("已至尾页");
//         else{
//             currentPage = currentPage+1;
//             var need=currentPage;
//
//             $.get('userli/Pager.action','need='+need,function(result){
//                 userlist = result['userList'];
//                 getUser(userlist);
//                 //console.log(need);
//                 $('#current').text(need);
//             });
//         }
//     });
//
// });
// //跳转页
// $(document).ready(function(){
//     $('#jumpBtn').click(function(){
//         var toPage = $('#jumpPage').val();
//         if(toPage != ""){
//             toPage = parseInt(toPage);
//             if(toPage <= totalPage && toPage >=1)
//                 $.get('Pager','need='+toPage,function(result){
//                     userlist = result['userList'];
//                     getUser(userlist);
//                     //console.log(need);
//                     $('#current').text(toPage);
//                 });
//             else {
//                 alert("跳转页不合法!");
//             }
//         }
//     });
// });
//遍历list并生成table
function getUser(list){
    //先清空再添加
    var table = $('#content');
    table.html("");
    var thead = $("<tr></tr>");
    thead.appendTo(table);
    var tagName = $("<td>用户名</td>");
    tagName.appendTo(thead);
    tagName = $("<td>电话：</td>");
    tagName.appendTo(thead);
    tagName = $("<td>性别</td>");
    tagName.appendTo(thead);
    tagName = $("<td>年龄</td>");
    tagName.appendTo(thead);
    tagName = $("<td>操作</td>");
    tagName.appendTo(thead);
    
    for(var k in list){
        var tr=$("<tr></tr>");
        tr.appendTo(table);
        var person = new Object();
        var td;
        
        person.id=userlist[k]['uname'];
        person.name=userlist[k]['phone'];
        person.sex=userlist[k]['sex'];
        person.age=userlist[k]['age'];
            
        td=$("<td>"+person.id+"</td>");
        td.appendTo(tr);
        td=$("<td>"+person.name+"</td>");
        td.appendTo(tr);
        td=$("<td>"+person.sex+"</td>");
        td.appendTo(tr);
        td=$("<td>"+person.age+"</td>");
        td.appendTo(tr);
        //console.log(person);
    }
}