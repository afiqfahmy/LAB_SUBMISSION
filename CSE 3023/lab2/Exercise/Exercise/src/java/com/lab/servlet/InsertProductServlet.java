package com.lab.servlet;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/insert")
public class InsertProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Capture user inputs from the HTML form
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // 2. Create a Product object (JavaBean)
        Product newProduct = new Product(0, name, category, price, quantity);

        // 3. Interact with ProductDAO (No JDBC code here!)
        try {
            productDAO.insertProduct(newProduct);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 4. Redirect back to the product list
        response.sendRedirect("view");
    }
}
