package service.Cart;

import entity.Cart;

import java.util.List;

public interface IServiceCart {
    List<Cart> getCartByAccountID(int accountID);
    void editAmountCart(int accountID, int productID, int amount);
}
