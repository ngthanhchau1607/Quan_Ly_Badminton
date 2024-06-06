package dao.Invoice;

import entity.Invoice;

import java.sql.Date;
import java.util.List;

public interface IDaoInvoice {
    List<Invoice> listAll();
    void delete(int mahd);
    List<Invoice> findByDate(Date date);

}
