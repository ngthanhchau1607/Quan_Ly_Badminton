package controller.Invoice;

import service.Invoice.IServiceInvoice;
import service.Invoice.ServiceInvoice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/deleteInvoice")
public class DeleteInvoice extends HttpServlet {
    IServiceInvoice serviceInvoice = new ServiceInvoice();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        delete(req,resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        int id = Integer.parseInt(req.getParameter("mahd"));
        HttpSession session = req.getSession();
        try {
            serviceInvoice.delete(id);
            session.setAttribute("message", "Xóa thành công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Xóa thất bại");
        }


        resp.sendRedirect("managerInvoice");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        delete(req,resp);
    }
}
