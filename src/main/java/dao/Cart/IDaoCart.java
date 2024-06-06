package dao.Cart;

import entity.Cart;

import java.util.List;

public interface IDaoCart {
    List<Cart> getCartByAccountID(int accountID);
    void editAmountCart(int accountID, int productID, int amount);
}
