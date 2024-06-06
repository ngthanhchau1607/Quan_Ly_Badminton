package controller;

import entity.Account;
import service.Account.IServiceAccount;
import service.Account.ServiceAccount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns ={"/login"})
public class LoginController extends HttpServlet {
    IServiceAccount serviceAccount = new ServiceAccount();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie arr[] = req.getCookies();
        if(arr != null) {
            for(Cookie o : arr) {
                // Kiểm tra xem tên của cookie hiện tại có bằng "userC" hay không
                if(o.getName().equals("userC")) {
                    // Nếu đúng, đặt giá trị của cookie này vào thuộc tính "username"
                    req.setAttribute("username", o.getValue());
                }
                // Kiểm tra xem tên của cookie hiện tại có bằng "passC" hay không
                if(o.getName().equals("passC")) {
                    // Nếu đúng, đặt giá trị của cookie này vào thuộc tính "password"
                    req.setAttribute("password", o.getValue());
                }
            }
        }

        req.getRequestDispatcher("/Log/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String username = req.getParameter("user");
        String password = req.getParameter("pass");

        Account a = serviceAccount.login(username, password);
        if (a == null) {
            req.setAttribute("error", "Sai username hoac password!");
            req.getRequestDispatcher("/Log/login.jsp").forward(req, resp);
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("acc", a);
            session.setMaxInactiveInterval(60*60*24);
            //luu account len tren cookie
            Cookie u = new Cookie("userC", username);
            Cookie p = new Cookie("passC", password);
            p.setMaxAge(60*60*24);
            u.setMaxAge(60*60*24);


            resp.addCookie(u);//luu u va p len Chrome
            resp.addCookie(p);

            resp.sendRedirect("home");
        }
    }
}
