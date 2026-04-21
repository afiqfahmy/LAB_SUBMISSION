<%@ include file="header.jsp" %>

<%
    String bmiStr = request.getParameter("bmi");
    String category = request.getParameter("category");

    if (bmiStr == null || category == null) {
        response.sendRedirect("bmiCalculator.jsp");
        return;
    }

    double bmi = Double.parseDouble(bmiStr);
%>

<div style="margin-top: 20px; border-top: 1px solid #ccc; padding-top: 20px;">
    <h2>BMI Result</h2>
    <p><strong>BMI Value:</strong> <%= String.format("%.2f", bmi)%></p>
    <p><strong>Category:</strong> <%= category%></p>

    <br>
    <a href="bmiCalculator.jsp">Calculate Again</a>
</div>

<%@ include file="footer.jsp" %>