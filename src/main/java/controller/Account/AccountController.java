package controller.Account;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Account;
import service.Account.IServiceAccount;
import service.Account.ServiceAccount;

@WebServlet(urlPatterns = {"/managerAccount"})
public class AccountController extends HttpServlet {
    IServiceAccount serviceAccount = new ServiceAccount();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        findAll(req,resp);
    }

    private void findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        List<Account> list = serviceAccount.findAll();
        req.setAttribute("listacc",list);

        req.getRequestDispatcher("/Manager/manager.jsp").forward(req,resp);

    }
}
