<%@ page import="java.util.List" %>
<%@ page import="com.tust.school.res.domain.dto.course.CourseResult" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>index</title>
</head>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/student/student.js"></script>
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
    <h2 style="color: white; width: 400px; height: 60px; line-height: 60px; margin: 0 0 0 30px; padding: 0;">已选课程列表</h2>
</div>
<body style="background-color: #4579a3">
<table>
    <tr>
        <td>课程号</td>
        <td>课程名</td>
        <td>星期</td>
        <td>课程开始时间</td>
        <td>课程结束时间</td>
        <td>限选人数</td>
        <td>当前选课人数</td>
        <td>操作</td>
    </tr>
    <%
        List<CourseResult> courseResults = (List<CourseResult>) request.getAttribute("courseList");
        for(CourseResult courseResult:courseResults)
        {%>
    <tr>
        <td><%=courseResult.getNo()%></td>
        <td><%=courseResult.getName() %></td>
        <td><%=courseResult.getCourseDay() %></td>
        <td><%=courseResult.getCourseStart() %></td>
        <td><%=courseResult.getCourseEnd() %></td>
        <td><%=courseResult.getMaxStuNum() %></td>
        <td><%=courseResult.getCurrentStuNum() %></td>
        <td><button onclick="unSelectCourse(<%=courseResult.getId() %>)" >退选</button></td>
    </tr>
    <%}
    %>
</table>
</body>
</html>