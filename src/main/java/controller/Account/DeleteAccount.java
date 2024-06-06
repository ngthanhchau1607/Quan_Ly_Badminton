package controller.Account;

import service.Account.IServiceAccount;
import service.Account.ServiceAccount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/deleteAccount"})
public class DeleteAccount extends HttpServlet {
    IServiceAccount serviceAccount = new ServiceAccount();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        try {
            serviceAccount.delete(id);
            session.setAttribute("message", "Xóa thành công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xóa thất bại");
        }


        resp.sendRedirect("managerAccount");
    }
}
