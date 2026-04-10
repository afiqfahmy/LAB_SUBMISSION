package com.lab.servlet;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/edit") // This MUST match your link: <a href="edit?id=...">
public class EditProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productDAO.selectProduct(id);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><body><h2>Edit Product</h2>");
        out.println("<form action='update' method='post'>"); // Submits to UpdateProductServlet
        out.println("<input type='hidden' name='id' value='" + existingProduct.getId() + "'>");
        out.println("Name: <input type='text' name='name' value='" + existingProduct.getName() + "'><br>");
        out.println("Category: <input type='text' name='category' value='" + existingProduct.getCategory() + "'><br>");
        out.println("Price: <input type='number' step='0.01' name='price' value='" + existingProduct.getPrice() + "'><br>");
        out.println("Quantity: <input type='number' name='quantity' value='" + existingProduct.getQuantity() + "'><br>");
        out.println("<input type='submit' value='Save Changes'>");
        out.println("</form></body></html>");
    }
}
