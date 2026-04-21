<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String weightStr = request.getParameter("weight");
    String heightStr = request.getParameter("height");

    double weight = 0;
    double height = 0;
    double bmi = 0;
    String category = "";

    try {
        if (weightStr == null || heightStr == null || weightStr.isEmpty() || heightStr.isEmpty()) {
            throw new Exception();
        }

        weight = Double.parseDouble(weightStr);
        height = Double.parseDouble(heightStr);

        if (height <= 0) {
            throw new Exception();
        }

        // Logic fix: If height is entered in cm (e.g., 178), convert to meters (1.78)
        if (height > 3) {
            height = height / 100;
        }

        // BMI formula: weight (kg) / [height (m)]^2
        bmi = weight / (height * height);

        if (bmi < 18.5) {
            category = "Underweight";
        } else if (bmi <= 25) {
            category = "Normal Weight";
        } else if (bmi <= 30) {
            category = "Overweight";
        } else {
            category = "Obese";
        }

    } catch (Exception e) {
        response.sendRedirect("bmiCalculator.jsp");
        return;
    }
%>

<jsp:forward page="resultBMI.jsp">
    <jsp:param name="bmi" value="<%= bmi%>" />
    <jsp:param name="category" value="<%= category%>" />
</jsp:forward>