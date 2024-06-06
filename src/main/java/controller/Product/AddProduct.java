package controller.Product;

import entity.Product;
import service.Product.IServiceProduct;
import service.Product.ServiceProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/addProduct"})
public class AddProduct extends HttpServlet {
    IServiceProduct serviceProduct = new ServiceProduct();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        add(req,resp);
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        try {
            // Lấy dữ liệu từ trang JSP
            String productName = req.getParameter("productName");
            String productImage = req.getParameter("productImage");
            double productPrice = Double.parseDouble(req.getParameter("productPrice"));
            String productTitle = req.getParameter("productTitle");
            String productDescription = req.getParameter("productDescription");
            int productCateID = Integer.parseInt(req.getParameter("productCateID"));
            int productSuppID = Integer.parseInt(req.getParameter("productSuppID"));
            String productProperties = req.getParameter("productProperties");
            String productImage2 = req.getParameter("productImage2");
            String productImage3 = req.getParameter("productImage3");

            Product newProduct = new Product(0, productName, productImage, productPrice, productTitle, productDescription, productCateID, productSuppID, productProperties, productImage2, productImage3);
            serviceProduct.add(newProduct);

            resp.sendRedirect(req.getContextPath() + "/manageProduct");
            session.setAttribute("message", "Thêm tài khoản thành công!");
        }
        catch (Exception e){
            session.setAttribute("error", "Thêm tài khoản thất bại: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        add(req,resp);
    }
}

