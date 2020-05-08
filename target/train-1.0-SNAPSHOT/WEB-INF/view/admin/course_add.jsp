<%@ page import="java.util.Objects" %>
<%@ page import="com.tust.school.res.domain.dto.course.CourseResult" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tust.school.res.domain.dto.teacher.TeacherResult" %>
<%@ page import="com.tust.school.res.domain.dto.classroom.ClassroomResult" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>index</title>
</head>

<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/admin/admin.js"></script>
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
    #reg_frame {
        width: 400px;
        height: 400px;
        padding: 13px;

        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -200px;
        margin-top: -200px;

        background-color: rgba(240, 255, 255, 0.5);

        border-radius: 10px;
        text-align: center;
    }
    #line_height {
        line-height:45px;
    }
    #btn {
        font-size: 14px;
        font-family: 宋体;

        width: 100px;
        height: 28px;
        line-height: 28px;
        text-align: center;

        color: white;
        background-color: #3BD9FF;
        border-radius: 6px;
        border: 0;
    }
</style>

<div class="header" style="padding: 0;">
    <h2 style="color: white; width: 400px; height: 60px; line-height: 60px; margin: 0 0 0 30px; padding: 0;">新增或修改课程</h2>
</div>
<body style="background-color: #4579a3">
<div id="reg_frame">
    <form id="line_height">
    <%
        CourseResult courseResult = (CourseResult) request.getAttribute("courseResult");
        if (Objects.isNull(courseResult.getId())) {
            courseResult.setName("");
            courseResult.setCourseDay(0);
            courseResult.setMaxStuNum(0);
            courseResult.setTeacherName("");
            courseResult.setCourseStart(new Time(0L));
            courseResult.setCourseEnd(new Time(0L));
        }
    %>
    课程名:<input type="text" id="name" name="name" value="<%=courseResult.getName() %>"><br>
    星期:<input type="text" id="courseDay" name="courseDay" value="<%=courseResult.getCourseDay() %>"><br>
    课程开始时间:<input type="text" id="courseStart" name="courseStart" value="<%=courseResult.getCourseStart() %>" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss'})"  /><br>
    课程结束时间:<input type="text" id="courseEnd" name="courseEnd" value="<%=courseResult.getCourseEnd() %>"  class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss'})"  /><br>
    限选人数:<input type="text" id="maxStuNum" name="maxStuNum" value="<%=courseResult.getMaxStuNum() %>"><br>
    任教教师:<select id="teacherSelect">
    <option value="0" selected>请选择：</option>
    <%
        List<TeacherResult> list = (List) request.getAttribute("teacherResults");
        for (TeacherResult teacherResult: list) {
    %>
    <option value="<%=teacherResult.getId()%>"  ><%=teacherResult.getName()%></option>
    <%} %>
    </select>
        <br>
        上课教室:<select id="classroomSelect">
        <option value="0" selected>请选择：</option>
        <%
            List<ClassroomResult> classroomResults =  (List) request.getAttribute("classroomResults");
            for (ClassroomResult classroomResult: classroomResults) {
        %>
        <option value="<%=classroomResult.getId()%>"  ><%=classroomResult.getName()%></option>
        <%} %>
    </select>
    <br>
    <input type="button" value="提交" onclick="saveCourse(<%=courseResult.getId()%>)" id="btn">
</form>
</div>
</body>
</html>