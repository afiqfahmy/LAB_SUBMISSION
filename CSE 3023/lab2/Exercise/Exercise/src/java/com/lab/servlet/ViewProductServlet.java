package com.lab.servlet;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/view")
public class ViewProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Fetch all products from DAO
        List<Product> list = productDAO.selectAllProducts();

        out.println("<html><body>");
        out.println("<h2>Product Inventory</h2>");
        out.println("<a href='add_product.html'>Add New Product</a><br><br>");
        out.println("<table border='1' width='80%'>");
        out.println("<tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Quantity</th><th>Actions</th></tr>");

        // Loop through the list and generate table rows
        for (Product p : list) {
            out.println("<tr>");
            out.println("<td>" + p.getId() + "</td>");
            out.println("<td>" + p.getName() + "</td>");
            out.println("<td>" + p.getCategory() + "</td>");
            out.println("<td>" + p.getPrice() + "</td>");
            out.println("<td>" + p.getQuantity() + "</td>");
            // Requirement 5: Functional Edit and Delete links
            out.println("<td>" 
                + "<a href='edit?id=" + p.getId() + "'>Edit</a> | " 
                + "<a href='delete?id=" + p.getId() + "' onclick='return confirm(\"Are you sure?\")'>Delete</a>" 
                + "</td>");
            out.println("</tr>");
        }

        out.println("</table>");
        out.println("</body></html>");
    }
}