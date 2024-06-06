
package controller.Cart;

import entity.Account;
import service.Cart.IServiceCart;
import service.Cart.ServiceCart;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "AddAmountCartControl", urlPatterns = {"/addAmountCart"})
public class AddAmountCartControl extends HttpServlet {
    IServiceCart serviceCart = new ServiceCart();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if(a == null) {
            response.sendRedirect("login");
            return;
        }
        int accountID = a.getAccount_id();
        int productID = Integer.parseInt(request.getParameter("productID"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        amount+=1;
        serviceCart.editAmountCart(accountID, productID, amount);
        request.setAttribute("mess", "Da tang so luong!");
        request.getRequestDispatcher("managerCart").forward(request, response);
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
