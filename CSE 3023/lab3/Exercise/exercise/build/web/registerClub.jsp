<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><title>Club Registration</title></head>
    <body>
        <%@include file="header.jsp" %>
        <h2>Registration Form</h2>
        <form action="processRegistration.jsp" method="POST">
            Name: <input type="text" name="stdName" required><br><br>
            Matric Number: <input type="text" name="matricNo" required><br><br>
            Selected Club: 
            <select name="clubName">
                <option value="Coding Club">Coding Club</option>
                <option value="Cyber Security Club">Cyber Security Club</option>
                <option value="Data Science Club">Data Science Club</option>
            </select><br><br>
            <input type="submit" value="Register Now">
        </form>
        <%@include file="footer.jsp" %>
    </body>
</html>