package controller.Account;

import entity.Account;
import service.Account.IServiceAccount;
import service.Account.ServiceAccount;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addAccount")
public class AddAccount extends HttpServlet {
    private IServiceAccount serviceAccount = new ServiceAccount();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        addAccount(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        addAccount(req, resp);
    }

    private void addAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        try {
            // Lấy các tham số từ request
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String fullname = req.getParameter("fullname");
            String email = req.getParameter("email");
            String dateOfBirthString = req.getParameter("date_of_birth");
            int role = Integer.parseInt(req.getParameter("role"));

            // Chuyển đổi chuỗi dateOfBirthString thành đối tượng Date
            Date dateOfBirth = Date.valueOf(dateOfBirthString);

            // Tạo đối tượng Account mới
            Account newAccount = new Account(0, username, password, fullname, email, dateOfBirth, role);
            serviceAccount.insert(newAccount);

            // Lưu thông báo thành công vào session
            session.setAttribute("message", "Thêm tài khoản thành công!");
        } catch (Exception e) {
            // Lưu thông báo lỗi vào session
            session.setAttribute("error", "Thêm tài khoản thất bại: " + e.getMessage());
        }

        // Chuyển hướng tới trang quản lý tài khoản
        resp.sendRedirect(req.getContextPath() + "/managerAccount");
    }
}
