<%@ page import="java.util.List" %>
<%@ page import="com.tust.school.res.domain.dto.course.ScoreResult" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>index</title>
</head>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/teacher/teacher.js"></script>
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
    <h2 style="color: white; width: 400px; height: 60px; line-height: 60px; margin: 0 0 0 30px; padding: 0;">成绩列表</h2>
</div>
<body style="background-color: #4579a3">
<table>
    <tr>
        <td>学生Id</td>
        <td>学生姓名</td>
        <td>课程Id</td>
        <td>课程姓名</td>
        <td>成绩</td>
        <td>操作</td>
    </tr>
    <%
        List<ScoreResult> scoreResults = (List<ScoreResult>) request.getAttribute("scoreResults");
        for(ScoreResult scoreResult:scoreResults)
        {%>
    <tr>
        <td><%=scoreResult.getStudentId()%></td>
        <td><%=scoreResult.getStudentName() %></td>
        <td><%=scoreResult.getCourseId() %></td>
        <td><%=scoreResult.getCourseName() %></td>
        <td><input type="text" value="<%=scoreResult.getScore() %>" id="score"></td>
        <td><button onclick="inputScore(this)" >修改成绩</button></td>
    </tr>
    <%}
    %>
</table>
</body>
</html>