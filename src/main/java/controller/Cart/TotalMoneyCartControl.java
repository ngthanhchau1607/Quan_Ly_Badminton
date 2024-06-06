package controller.Cart;
import entity.Account;
import entity.Cart;
import entity.Category;
import entity.Product;
import service.Cart.IServiceCart;
import service.Cart.ServiceCart;
import service.Product.IServiceProduct;
import service.Product.ServiceProduct;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "TotalMoneyCartControl", urlPatterns = {"/totalMoneyCart"})
public class TotalMoneyCartControl extends HttpServlet {
    IServiceCart serviceCart = new ServiceCart();
    IServiceProduct serviceProduct = new ServiceProduct();

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Account a = (Account) session.getAttribute("acc");
        if(a == null) {
            resp.sendRedirect("login");
            return;
        }
        int accountID = a.getAccount_id();
        List<Cart> list = serviceCart.getCartByAccountID(accountID);
        List<Product> list1 = serviceProduct.listAll();

        req.setAttribute("listcart",list);
        req.setAttribute("listproduct",list1);

        double totalMoney=0;
        for(Cart o : list) {
            for(Product p : list1) {
                if(o.getProductID()==p.getId()) {
                    totalMoney=totalMoney+(p.getPrice()*o.getAmount());
                }
            }
        }

        double totalMoneyShip=totalMoney+10.0;
        PrintWriter out = resp.getWriter();
        out.print("<div class='card border-secondary mb-5' id='contentTotalMoney'>");
        out.print("<div class='card-header bg-secondary border-0'>");
        out.print("<h4 class='font-weight-semi-bold m-0'>Thành Tiền</h4>");
        out.print("</div>");
        out.print("<div class='card-body'>");
        out.print("<div class='d-flex justify-content-between mb-3 pt-1'>");
        out.print("<h6 class='font-weight-medium'>Tổng tiền hàng</h6>");
        out.print("<h6 class='font-weight-medium'>" + totalMoney + "</h6>");
        out.print("</div>");
        out.print("<div class='d-flex justify-content-between'>");
        out.print("<h6 class='font-weight-medium'>Phí vận chuyển</h6>");
        out.print("<h6 class='font-weight-medium'>10.0</h6>");
        out.print("</div>");
        out.print("</div>");
        out.print("<div class='card-footer border-secondary bg-transparent'>");
        out.print("<div class='d-flex justify-content-between mt-2'>");
        out.print("<h5 class='font-weight-bold'>Total</h5>");
        out.print("<h5 class='font-weight-bold'>" + totalMoneyShip + "</h5>");
        out.print("</div>");
        out.print("<button class='btn btn-block btn-primary my-3 py-3'>Thanh Toán</button>");
        out.print("</div>");
        out.print("</div>");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }



}
