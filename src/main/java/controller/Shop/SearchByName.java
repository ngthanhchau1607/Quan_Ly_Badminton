package controller.Shop;

import entity.Product;
import service.Product.IServiceProduct;
import service.Product.ServiceProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = {"/searchbyname"})
public class SearchByName extends HttpServlet {
    IServiceProduct serviceProduct = new ServiceProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        String txtSearch = req.getParameter("txt");
        List<Product> list = serviceProduct.listsearchbyname(txtSearch);
        PrintWriter out = resp.getWriter();

        for (Product product : list) {
            // Hiển thị sản phẩm
            System.out.println("Product Name: " + product.getName());
            System.out.println("Product Image: " + product.getImage());
            System.out.println("Product Price: " + product.getPrice());
            System.out.println("--------------------------");

            // Hiển thị sản phẩm trong HTML
            out.println("<div class=\"col-lg-3 col-md-6 col-sm-12 pb-1\">");
            out.println("<div class=\"card product-item border-0 mb-4\">");
            out.println("<div class=\"card-header product-img position-relative overflow-hidden bg-transparent border p-0\">");
            out.println("<img class=\"img-fluid w-100\" src=\"" + product.getImage() + "\" alt=\"\">");
            out.println("</div>");
            out.println("<div class=\"card-body border-left border-right text-center p-0 pt-4 pb-3\">");
            out.println("<h6 class=\"text-truncate mb-3\">" + product.getName() + "</h6>");
            out.println("<div class=\"d-flex justify-content-center\">");
            out.println("<h6>" + product.getPrice() + "</h6><h6 class=\"text-muted ml-2\"><del>100.00</del></h6>");
            out.println("</div>");
            out.println("</div>");
            out.println("<div class=\"card-footer d-flex justify-content-between bg-light border\">");
            out.println("<a href=\"detail?pid=" + product.getId() + "\" class=\"btn btn-sm text-dark p-0\"><i class=\"fas fa-eye text-primary mr-1\"></i>View Detail</a>");
            out.println("<a href=\"\" class=\"btn btn-sm text-dark p-0\"><i class=\"fas fa-shopping-cart text-primary mr-1\"></i>Add To Cart</a>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");

        }
    }
}
