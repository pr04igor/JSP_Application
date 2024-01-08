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
        body 
        {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
            margin: 20px;
            text-align: center;
        }

        h1 
        {
            color: #4285f4;
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        form 
        {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form table 
        {
            width: 100%;
        }

        form th, form td 
        {
            padding: 10px;
        }

        form label 
        {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        form input 
        {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] 
        {
            background-color: #4285f4;
            color: #fff;
            cursor: pointer;
        }

        .custom-table 
        {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .custom-table th,
        .custom-table td 
        {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }   

        .custom-table th 
        {
            background-color: #4285f4;
            color: #fff;
        }
    </style>
</head>

<body>
    <h1>Servlet</h1>
    <form method = "post" action="StudentAdd">
        <table>
        <tbody>
            <tr>
                <td><label for="name">Name</label></td>
                <td><input id="name" type="text" name="name"></td>
            </tr>
            <tr>
                <td><label for="surname">Surname</label></td>
                <td><input id="surname" type="text" name="surname"></td>
            </tr>
            <tr>
                <td><label for="email">Email</label></td>
                <td><input id="email" type="email" name="email"></td>
            </tr>
            <tr>
                <td><label for="group">Group</label></td>
                <td><input id="group" type="text" name="group"></td>
            </tr>
            <tr>
                <td><label for="faculty">Faculty</label></td>
                <td><input id="faculty" type="text" name="faculty"></td>
            </tr>
        </tbody>
        </table>
        <input type="submit" name="send" value="Send">
        </form>

    <% List<Student> students = (List<Student>)application.getAttribute("students"); %>
    <c:if test="${students.size() > 0}">
        <table class = "custom-table">
            <tr>
                <th> Name </th>
                <th> Surname </th>
                <th> Email </th>
                <th> Group </th>
                <th> Faculty </th>
            </tr>
            <c:forEach var = "student" items="${students}">
                <tr>
                    <td> <c:out value="${student.getName()}" /> </td>
                    <td> <c:out value="${student.getSurname()}" /> </td>
                    <td> <c:out value="${student.getEmail()}" /> </td>
                    <td> <c:out value="${student.getGroup()}" /> </td>
                    <td> <c:out value="${student.getFaculty()}" /> </td>
                </tr>
            </c:forEach>    
        </table>
    </c:if>
    
    </body>
</html>