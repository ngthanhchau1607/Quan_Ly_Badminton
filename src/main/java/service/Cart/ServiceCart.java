package service.Cart;

import dao.Cart.DaoCart;
import dao.Cart.IDaoCart;
import entity.Cart;

import java.util.List;

public class ServiceCart implements IServiceCart{
    IDaoCart daoCart = new DaoCart();
    @Override
    public List<Cart> getCartByAccountID(int accountID) {
        return daoCart.getCartByAccountID(accountID);
    }

    @Override
    public void editAmountCart(int accountID, int productID, int amount) {
        daoCart.editAmountCart(accountID,productID,amount);
    }
}
