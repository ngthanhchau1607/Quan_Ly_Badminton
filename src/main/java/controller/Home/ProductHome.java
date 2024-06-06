package controller.Home;

import entity.Product;
import service.Product.IServiceProduct;
import service.Product.ServiceProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/home"})
public class ProductHome extends HttpServlet {
    IServiceProduct serviceProduct = new ServiceProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        List<Product> list = serviceProduct.last4Product();
        List<Product> list1 = serviceProduct.last4ProductV();

        req.setAttribute("last4product",list);
        req.setAttribute("last4productV",list1);
        req.getRequestDispatcher("View/Home.jsp").forward(req,resp);
    }
}

