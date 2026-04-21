<%@ include file="header.jsp" %>

<h2>BMI Calculator</h2>

<form action="processBMI.jsp" method="post">
    Weight (kg): <input type="text" name="weight" placeholder="e.g. 63" required><br><br>
    Height (cm): <input type="text" name="height" placeholder="e.g. 178" required><br><br>

    <input type="submit" value="Calculate BMI">
</form>

<%@ include file="footer.jsp" %>