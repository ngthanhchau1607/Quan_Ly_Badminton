package controller.Invoice;

import entity.Account;
import entity.Invoice;
import service.Account.IServiceAccount;
import service.Account.ServiceAccount;
import service.Invoice.IServiceInvoice;
import service.Invoice.ServiceInvoice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(urlPatterns = "/managerInvoice")
public class InvoiceController extends HttpServlet {
    IServiceInvoice serviceInvoice = new ServiceInvoice();
    IServiceAccount serviceAccount = new ServiceAccount();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            listAll(req, resp);
    }
    private void listAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        List<Invoice> list = serviceInvoice.listAll();
        List<Account> list1 = serviceAccount.findAll();
        req.setAttribute("listinvoice",list);
        req.setAttribute("listacc",list1);
        req.getRequestDispatcher("/Manager/managerinvoice.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        listAll(req,resp);
    }
}
