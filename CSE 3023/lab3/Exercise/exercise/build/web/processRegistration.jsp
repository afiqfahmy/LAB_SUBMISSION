<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head><title>Registration Success</title></head>
    <body>
        <%@include file="header.jsp" %>
        <%
            String name = request.getParameter("stdName");
            String matric = request.getParameter("matricNo");
            String club = request.getParameter("clubName");

            if (name != null) {
                // Get the list from session, or create a new one if it doesn't exist
                ArrayList<String[]> memberList = (ArrayList<String[]>) session.getAttribute("allMembers");
                if (memberList == null) {
                    memberList = new ArrayList<String[]>();
                }

                // Store as an array [Name, Matric, Club]
                String[] newStudent = {name, matric, club};
                memberList.add(newStudent);

                // Save the updated list back to the session
                session.setAttribute("allMembers", memberList);
        %>
        <h2>Registration Successful!</h2>
        <p>Welcome, <b><%= name%></b>! You have been added to the directory.</p>
        <%
            }
        %>
        <br>
        <a href="memberDirectory.jsp">View Member Directory</a>
        <%@include file="footer.jsp" %>
    </body>
</html>