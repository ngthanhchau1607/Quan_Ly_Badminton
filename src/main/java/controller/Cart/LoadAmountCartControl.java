
package controller.Cart;

import entity.Account;
import entity.Cart;
import service.Cart.IServiceCart;
import service.Cart.ServiceCart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoadAmountCartControl", urlPatterns = {"/loadAllAmountCart"})
public class LoadAmountCartControl extends HttpServlet {
    IServiceCart serviceCart = new ServiceCart();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int totalAmountCart =0;
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        // In ra ID tài khoản đăng nhập để kiểm tra
        System.out.println("Account ID: " + (a != null ? a.getAccount_id() : "Not logged in"));

        if(a == null) {
        	PrintWriter out = response.getWriter();
            out.println(totalAmountCart);
        	return;
        }
        int accountID = a.getAccount_id();
        List<Cart> list = serviceCart.getCartByAccountID(accountID);
        totalAmountCart = list.size();

        // In ra số lượng ra console
        System.out.println("Total amount in cart: " + totalAmountCart);

        //in list p day
        PrintWriter out = response.getWriter();
        out.println(totalAmountCart);

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
