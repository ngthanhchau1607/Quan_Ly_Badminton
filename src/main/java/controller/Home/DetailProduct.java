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

@WebServlet(urlPatterns = {"/detail"})
public class DetailProduct extends HttpServlet {
    IServiceProduct serviceProduct = new ServiceProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("pid"));
        Product product = serviceProduct.getProductById(id);

        int cateIdProduct = serviceProduct.getCateIDByProductID(id);
        List<Product> listRelateProduct = serviceProduct.listRelated(cateIdProduct);
        // In ra danh sách sản phẩm liên quan trên console
        System.out.println("Danh sách sản phẩm liên quan:");
        for (Product product1 : listRelateProduct) {
            System.out.println("ID: " + product1.getId());
            System.out.println("Tên sản phẩm: " + product1.getName());
            System.out.println("Giá sản phẩm: " + product1.getPrice());
            // In thêm các thông tin khác của sản phẩm nếu cần
            System.out.println("------------------------------------");
        }

        req.setAttribute("detail",product);
        req.setAttribute("relate",listRelateProduct);
        req.getRequestDispatcher("/View/detail.jsp").forward(req,resp);
    }
}
