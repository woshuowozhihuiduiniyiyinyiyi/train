<%@ page import="java.util.List" %>
<%@ page import="com.tust.school.res.domain.dto.classroom.ClassroomResult" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>index</title>
</head>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/admin/admin.js"></script>
<style type="text/css">
    table
    {
        border-collapse:collapse;
    }
    table, td, th
    {
        margin:0px auto;
        border:1px solid #096d9c;
        text-align: center;
        padding: 10px;
        background-color: #FFFFFF;
    }
</style>
<div class="header" style="padding: 0;">
    <h2 style="color: white; width: 400px; height: 60px; line-height: 60px; margin: 0 0 0 30px; padding: 0;">教室列表</h2>
</div>
<body style="background-color: #4579a3">
<button onclick="addClassroom(0)" >添加教室</button>
<table>
    <tr>
        <td>教室Id</td>
        <td>教室编号</td>
        <td>教室名称</td>
        <td>最大学生数</td>
        <td>是否多媒体</td>
        <td>地址</td>
        <td>状态</td>
        <td>操作</td>
    </tr>
    <%
        List<ClassroomResult> classroomResults = (List<ClassroomResult>) request.getAttribute("classroomResults");
        for(ClassroomResult classroomResult:classroomResults)
        {%>
    <tr>
        <td><%=classroomResult.getId()%></td>
        <td><%=classroomResult.getNo() %></td>
        <td><%=classroomResult.getName() %></td>
        <td><%=classroomResult.getMaxStuNum() %></td>
        <td><%=classroomResult.getHasVideoStr() %></td>
        <td><%=classroomResult.getAddress() %></td>
        <td><%=classroomResult.getStatusStr() %></td>
        <td>
            <button onclick="updateClassroomStatus(<%=classroomResult.getId()%>, <%=classroomResult.getStatus()%>)" >修改状态</button>
            <button onclick="addClassroom(<%=classroomResult.getId()%>)">编辑</button>
            <button onclick="deleteClassroom(<%=classroomResult.getId()%>)" >删除</button>
        </td>
    </tr>
    <%}
    %>
</table>
</body>
</html>