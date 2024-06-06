package controller.Product;

import service.Product.IServiceProduct;
import service.Product.ServiceProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/deleteProduct"})
public class DeleteProduct extends HttpServlet {
    IServiceProduct serviceProduct = new ServiceProduct();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        delete(req,resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        try {
            serviceProduct.delete(id);
            session.setAttribute("message", "Xóa thành công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xóa thất bại");
        }
        resp.sendRedirect(req.getContextPath() + "/manageProduct");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        delete(req,resp);
    }
}
