package service.Invoice;

import dao.Invoice.DaoInvoice;
import dao.Invoice.IDaoInvoice;
import entity.Invoice;

import java.sql.Date;
import java.util.List;

public class ServiceInvoice implements IServiceInvoice{
    IDaoInvoice daoInvoice = new DaoInvoice();
    @Override
    public List<Invoice> listAll() {
        return daoInvoice.listAll();
    }

    @Override
    public void delete(int mahd) {
        daoInvoice.delete(mahd);
    }

    @Override
    public List<Invoice> findByDate(Date date) {
        return daoInvoice.findByDate(date);
    }
}
