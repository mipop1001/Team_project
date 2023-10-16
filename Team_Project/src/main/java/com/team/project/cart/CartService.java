package com.team.project.cart;

import java.util.ArrayList;

public interface CartService {
	public void user_product_cart(int member_number,int product_number);
	public ArrayList<CartDTO> user_product_cart_view(int member_number);
	public int user_product_cart_check(int product_number, int member_number);
	public void cart_delete_item(int product_number,int member_number);
}
