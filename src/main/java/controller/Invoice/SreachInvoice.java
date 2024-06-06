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
import java.util.List;

@WebServlet(urlPatterns = "/searchInvoice")
public class SreachInvoice extends HttpServlet {
    IServiceInvoice serviceInvoice = new ServiceInvoice();
    IServiceAccount serviceAccount = new ServiceAccount();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        findlist(req,resp);
    }

    private void findlist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("text/html;charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");

            String dateXuatStr = req.getParameter("dateXuat");
            List<Invoice> list = null;
            List<Account> list1 = serviceAccount.findAll();
            if (dateXuatStr != null && !dateXuatStr.isEmpty()) {
                try {
                    Date date = Date.valueOf(dateXuatStr);
                    System.out.println("Searching for invoices with date: " + date);
                    list = serviceInvoice.findByDate(date);
                }
                catch (IllegalArgumentException e) {
                    e.printStackTrace();
                    req.getSession().setAttribute("error", "Định dạng ngày không hợp lệ");
                }
            } else {
                req.getSession().setAttribute("error", "Vui lòng chọn ngày");
            }
            req.setAttribute("listinvoice", list);
            req.setAttribute("listacc", list1);
            req.getRequestDispatcher("/Manager/managerinvoice.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        findlist(req,resp);
    }
}
