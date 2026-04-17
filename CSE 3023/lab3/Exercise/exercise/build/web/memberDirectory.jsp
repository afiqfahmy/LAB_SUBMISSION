<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Member Directory</title>
        <style>
            table {
                border-collapse: collapse;
                width: 80%;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #444;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f4f4f4;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h2>Student Club Member Directory</h2>

        <%
            // Retrieve the dynamic list from session
            ArrayList<String[]> memberList = (ArrayList<String[]>) session.getAttribute("allMembers");
        %>

        <table>
            <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Matric Number</th>
                <th>Club</th>
            </tr>

            <%
                if (memberList == null || memberList.isEmpty()) {
            %>
            <tr>
                <td colspan="4">No members registered yet.</td>
            </tr>
            <%
            } else {
                for (int i = 0; i < memberList.size(); i++) {
                    String[] student = memberList.get(i);
            %>
            <tr>
                <td><%= i + 1%></td>
                <td><%= student.length > 0 ? student[0] : ""%></td>
                <td><%= student.length > 1 ? student[1] : ""%></td>
                <td><%= student.length > 2 ? student[2] : ""%></td>
            </tr>
            <%
                    }
                }
            %>
        </table>

        <%@include file="footer.jsp" %>
    </body>
</html>