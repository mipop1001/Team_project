package com.team.project.order;

import java.util.ArrayList;

import com.team.project.seller.SellerDTO;

public interface OrderService {

	public void user_product_order(int product_number, int member_number);
	public void insert_order_history(OrderDTO od);
	public ArrayList<OrderDTO> customer_order_view(int member_number);
	public ArrayList<OrderDTO> seller_product_sales(String seller_number);
	public void delivery_status_update(int sell_list_number,String delivery_status);
}
