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
import java.util.List;

@WebServlet(urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {
    IServiceProduct serviceProduct = new ServiceProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        String index = req.getParameter("index");
        if (index == null || index.isEmpty()) {
            index = "1";
        }

        int indexPage = Integer.parseInt(index);
        List<Product> list = serviceProduct.getProductByIndex(indexPage);

        int allProduct = serviceProduct.countAllProduct();
        int endPage = allProduct/6;
        if(allProduct % 6 != 0) {
            endPage++;
        }

        req.setAttribute("tag", indexPage);
        req.setAttribute("endPage", endPage);
        req.setAttribute("listProduct", list);

        req.getRequestDispatcher("/View/shop.jsp").forward(req,resp);

    }
}
