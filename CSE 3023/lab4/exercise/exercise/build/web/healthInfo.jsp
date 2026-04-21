<%-- 
    Document   : healthInfo
    Created on : Apr 21, 2026, 3:35:46?PM
    Author     : azmyl
--%>

<%@page import="java.util.ArrayList"%>
<%@ include file="header.jsp" %>

<%
    ArrayList<String[]> bmiList = new ArrayList<>();

    bmiList.add(new String[]{"Below 18.5", "Underweight"});
    bmiList.add(new String[]{"18.5 - 25", "Normal"});
    bmiList.add(new String[]{"Above 25", "Overweight"});
%>

<h2>Health Information</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>BMI Range</th>
        <th>Category</th>
    </tr>

    <%
        for (String[] row : bmiList) {
    %>
    <tr>
        <td><%= row[0]%></td>
        <td><%= row[1]%></td>
    </tr>
    <%
        }
    %>

</table>

<%@ include file="footer.jsp" %>
