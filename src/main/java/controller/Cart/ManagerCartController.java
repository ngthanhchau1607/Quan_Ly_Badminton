package controller.Cart;

import entity.Account;
import entity.Cart;
import entity.Product;
import service.Cart.IServiceCart;
import service.Cart.ServiceCart;
import service.Product.IServiceProduct;
import service.Product.ServiceProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(urlPatterns ={"/managerCart"})
public class ManagerCartController extends HttpServlet {
    IServiceCart serviceCart = new ServiceCart();
    IServiceProduct serviceProduct = new ServiceProduct();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
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
        req.getRequestDispatcher("/View/cart.jsp").forward(req,resp);

        double totalMoney=0;
        for(Cart o : list) {
            for(Product p : list1) {
                if(o.getProductID()==p.getId()) {
                    totalMoney=totalMoney+(p.getPrice()*o.getAmount());
                }
            }
        }

        double totalMoneyShip=totalMoney+10.0;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}
