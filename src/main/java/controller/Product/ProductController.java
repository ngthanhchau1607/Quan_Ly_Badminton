package controller.Product;

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

@WebServlet(urlPatterns = "/manageProduct")
public class ProductController extends HttpServlet {
    IServiceProduct serviceProduct = new ServiceProduct();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        listAll(req,resp);
    }

    private void listAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String perPageStr = req.getParameter("perPage");
        int perPage = 8; // giá trị mặc định

        if (perPageStr != null && !perPageStr.equals("all")) {
            perPage = Integer.parseInt(perPageStr);
        }

        List<Product> list;
        if (perPageStr != null && perPageStr.equals("all")) {
            list = serviceProduct.listAll();
        } else {
            list = serviceProduct.listLimited(perPage);
        }

        req.setAttribute("listproduct", list);
        req.getRequestDispatcher("/Manager/managerproduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        listAll(req,resp);
    }
}
