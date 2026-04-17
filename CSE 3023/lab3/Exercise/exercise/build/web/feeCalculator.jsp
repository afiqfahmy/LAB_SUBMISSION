<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><title>Fee Calculator</title></head>
    <body>
        <%@include file="header.jsp" %>
        <h2>Membership Fee Calculator</h2>
        <form method="GET">
            Number of activities joined: <input type="number" name="count">
            <input type="submit" value="Calculate">
        </form>

        <%
            if (request.getParameter("count") != null) {
                int count = Integer.parseInt(request.getParameter("count"));
                double totalFee = count * 10.00;
        %>
        <h3>Total Fee: RM <%= String.format("%.2f", totalFee)%></h3>
        <% }%>
        <%@include file="footer.jsp" %>
    </body>
</html>