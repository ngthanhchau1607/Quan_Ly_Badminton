package controller.Account;

import entity.Account;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import service.Account.IServiceAccount;
import service.Account.ServiceAccount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@WebServlet(urlPatterns = "/exportToExcel")
public class XuatExcelAccount extends HttpServlet {
    IServiceAccount serviceAccount = new ServiceAccount();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        xuatfile(req,resp);
    }

    private void xuatfile(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html;charset=UTF-8");
        HttpSession  session = req.getSession();
        List<Account> list  = serviceAccount.findAll();

        int maximum = 2147483647;
        int minximum = 1;
        Random rn = new Random();
        int range = maximum - minximum +1;
        int randomNum = rn.nextInt(range) + minximum;

        FileOutputStream file = new FileOutputStream("F:\\DA\\Servlet\\ExcelWebBanVot\\"+"tai_khoan"+Integer.toString(randomNum)+".xlsx");
        XSSFWorkbook workbook=new XSSFWorkbook();     //Tạo ra cửa sổ
        XSSFSheet workSheet=workbook.createSheet("1");  // Tạo ra trang sheet 1

        XSSFRow row;   //Khai báo các hàng tiee đề
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;
        XSSFCell cell4;
        row=workSheet.createRow(0);  //Tạo hàng đầu tiên (hàng tiêu đề) và các ô để điền tên các cột
        cell0=row.createCell(0);
        cell0.setCellValue("Account ID");
        cell1=row.createCell(1);
        cell1.setCellValue("Username");
        cell2=row.createCell(2);
        cell2.setCellValue("FullName");
        cell3=row.createCell(3);
        cell3.setCellValue("Email");
        cell4=row.createCell(4);
        cell4.setCellValue("Là");

        //Them du lieu vào
        int i= 0;
        for (Account acc : list) {
            i=i+1;
            row=workSheet.createRow(i);
            cell0=row.createCell(0);
            cell0.setCellValue(acc.getAccount_id());
            cell1=row.createCell(1);
            cell1.setCellValue(acc.getUsername());
            cell2=row.createCell(2);
            cell2.setCellValue(acc.getFullname());
            cell3=row.createCell(3);
            cell3.setCellValue(acc.getEmail());
            // Chuyển đổi giá trị role từ số sang chuỗi
            String role = acc.getRole() == 1 ? "Admin" : "User";
            cell4 = row.createCell(4);
            cell4.setCellValue(role);
        }
        workbook.write(file);
        workbook.close();
        file.close();

        session.setAttribute("message", "Xuất file thành công!");
        resp.sendRedirect(req.getContextPath() + "/managerAccount");
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        xuatfile(req,resp);
    }
}
