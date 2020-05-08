<%@ page import="java.util.List" %>
<%@ page import="com.tust.school.res.domain.dto.teacher.TeacherResult" %>
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
    <h2 style="color: white; width: 400px; height: 60px; line-height: 60px; margin: 0 0 0 30px; padding: 0;">任教教师列表</h2>
</div>
<body style="background-color: #4579a3">
<button onclick="addTeacherIndex(0)"  id="btn">添加教师</button>
<table border="1" style="background-color: #ffffff">
    <tr>
        <td>教师Id</td>
        <td>教师编号</td>
        <td>教师姓名</td>
        <td>手机号</td>
        <td>专业</td>
        <td>状态</td>
        <td>操作</td>
    </tr>
    <%
        List<TeacherResult> teacherResults = (List<TeacherResult>) request.getAttribute("teacherResults");
        for(TeacherResult teacherResult:teacherResults)
        {%>
    <tr>
        <td><%=teacherResult.getId()%></td>
        <td><%=teacherResult.getNo() %></td>
        <td><%=teacherResult.getName() %></td>
        <td><%=teacherResult.getPhone() %></td>
        <td><%=teacherResult.getSpecialty() %></td>
        <td><%=teacherResult.getStatusStr() %></td>
        <td>
            <button onclick="updateTeacherStatus(<%=teacherResult.getId()%>, <%=teacherResult.getStatus()%>)" >修改状态</button>
            <button onclick="addTeacherIndex(<%=teacherResult.getId() %>)" >编辑</button>
            <button onclick="deleteTeacher(<%=teacherResult.getId()%>)" >删除</button>
        </td>
    </tr>
    <%}
    %>
</table>
</body>
</html>