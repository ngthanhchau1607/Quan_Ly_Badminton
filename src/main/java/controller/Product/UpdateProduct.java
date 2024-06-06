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

import static java.lang.System.out;

@WebServlet(urlPatterns = "/updateProduct")
public class UpdateProduct extends HttpServlet {
    IServiceProduct serviceProduct = new ServiceProduct();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Lấy thông tin sản phẩm từ request
            int productId = Integer.parseInt(req.getParameter("productId"));
            String name = req.getParameter("productName");
            String title = req.getParameter("productTitle");
            String image = req.getParameter("productImage");
            String description = req.getParameter("productDescription");
            double price = Double.parseDouble(req.getParameter("productPrice"));
            int cateID = Integer.parseInt(req.getParameter("categoryId")); // Đổi "categoryId" thành "cateID"
            int suppid = Integer.parseInt(req.getParameter("supplierId")); // Đổi "supplierId" thành "suppid"
            String properties = req.getParameter("productProperties");
            String image2 = req.getParameter("productImage2");
            String image3 = req.getParameter("productImage3");

            // Tạo đối tượng Product từ dữ liệu
            Product product = new Product(productId, name, image, price, title, description, cateID, suppid, properties, image2, image3);

            // Thực hiện cập nhật dữ liệu vào cơ sở dữ liệu
            serviceProduct.updateProduct(product);

            // Lưu thông báo thành công vào session
            req.getSession().setAttribute("successMessage", "Cập nhật sản phẩm thành công.");
        } catch (Exception e) {
            // Lưu thông báo thất bại vào session
            req.getSession().setAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật sản phẩm: " + e.getMessage());
        }

        // Chuyển hướng
        resp.sendRedirect(req.getContextPath() + "/manageProduct");
    }
}
