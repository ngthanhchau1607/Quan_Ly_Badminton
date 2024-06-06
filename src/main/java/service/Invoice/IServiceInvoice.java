package service.Invoice;

import entity.Invoice;

import java.sql.Date;
import java.util.List;

public interface IServiceInvoice {
    List<Invoice> listAll();
    void delete(int mahd);
    List<Invoice> findByDate(Date date);
}
