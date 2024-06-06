package controller.Account;

import com.fasterxml.jackson.databind.ObjectMapper;
import entity.Account;
import service.Account.IServiceAccount;
import service.Account.ServiceAccount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/getAccountById"})
public class EditAccount extends HttpServlet {
    IServiceAccount serviceAccount = new ServiceAccount();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int accountId = Integer.parseInt(req.getParameter("account_id"));
        Account account = serviceAccount.getAccountbyID(accountId);

        resp.setContentType("application/json");
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.writeValue(resp.getOutputStream(), account);
    }
}
