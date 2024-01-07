<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.mycompany.JSP_Application.Student"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Form</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
            margin: 20px;
            text-align: center;
        }

        h1 {
            color: #4285f4;
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4285f4;
            color: #fff;
            cursor: pointer;
        }

        .custom-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .custom-table th, .custom-table td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .custom-table th {
            background-color: #4285f4;
            color: #fff;
        }
    </style>
</head>

<body>
    <h1>Student Form</h1>
    <form>
        <label for="name">Name</label>
        <input id="name" type="text" name="name">

        <label for="surname">Surname</label>
        <input id="surname" type="text" name="surname">

        <label for="email">Email</label>
        <input id="email" type="email" name="email">

        <input type="submit" name="send" value="Send">
    </form>

    <% List<Student> students = (List<Student>) application.getAttribute("students"); %>
    <c:if test="${not empty param.send}">
        <%
        if (students == null) {
            students = new LinkedList<Student>();
            application.setAttribute("students", students);
        }
        if (request.getParameter("name") != "" || request.getParameter("surname") != "") {
            Student student = new Student();
            student.setName(request.getParameter("name"));
            student.setSurname(request.getParameter("surname"));
            student.setEmail(request.getParameter("email"));
            students.add(student);
        }
        response.sendRedirect("student_registration.jsp");
        %>
    </c:if>

    <%
    if (students != null) {
        out.println("<table class=\"custom-table\"> <tr><th> Name </th> <th> Surname </th> <th> Email </th> </tr>");
        for (Student s : students) {
            out.println("<tr><td>" + s.getName() + "</td><td>" + s.getSurname() + "</td><td>" + s.getEmail() + "</td></tr>");
        }
    }
    out.println("</table>");
    %>
</body>
</html>