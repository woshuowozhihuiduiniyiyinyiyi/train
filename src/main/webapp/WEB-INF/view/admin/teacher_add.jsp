<%@ page import="com.tust.school.res.domain.dto.teacher.TeacherResult" %>
<%@ page import="java.util.Objects" %>
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
<style type="text/css">
    #reg_frame {
        width: 400px;
        height: 280px;
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
    <h2 style="color: white; width: 400px; height: 60px; line-height: 60px; margin: 0 0 0 30px; padding: 0;">新增或修改教师</h2>
</div>
<body style="background-color: #4579a3">
<div id="reg_frame">
    <form id="line_height">
    <%
        TeacherResult teacherResult = (TeacherResult) request.getAttribute("teacherResult");
        if (Objects.isNull(teacherResult.getId())) {
            teacherResult.setName("");
            teacherResult.setPhone("");
            teacherResult.setSpecialty("");
        }
    %>
        <br>
    教师姓名<input type="text" id="name" name="name" value="<%=teacherResult.getName() %>"><br>
    教师手机号<input type="text" id="phone" name="phone" value="<%=teacherResult.getPhone() %>"><br>
    教师任教专业<input type="text" id="specialty" name="specialty" value="<%=teacherResult.getSpecialty() %>"><br><br>
    <input type="button" value="提交" onclick="saveTeacher(<%=teacherResult.getId() %>)" id="btn">
</form>
</div>
</body>
</html>