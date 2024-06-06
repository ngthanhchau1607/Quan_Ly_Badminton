package controller.Product;

import com.fasterxml.jackson.databind.ObjectMapper;
import entity.Product;
import service.Product.IServiceProduct;
import service.Product.ServiceProduct;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(urlPatterns = {"/editProduct"})
public class EditProduct extends HttpServlet {
    private IServiceProduct productService = new ServiceProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        int productId = Integer.parseInt(req.getParameter("id"));

        Product product = productService.getProductById(productId);

        String encodedName = URLEncoder.encode(product.getName(), "UTF-8");


        req.setAttribute("productName", encodedName);

        req.setAttribute("product", product);
        req.getRequestDispatcher("/Manager/editproduct.jsp").forward(req, resp);

    }
}
