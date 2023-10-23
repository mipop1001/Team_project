package com.team.project.product;

import java.util.ArrayList;

import com.team.project.board.PageDTO;

public interface ProductService {

	public void seller_product_join_save(ProductDTO dto);
	public ArrayList<ProductDTO> seller_product_out(String seller_id);
	public ArrayList<ProductDTO> seller_product_search_number(String seller_id,String product_search_value);
	public ArrayList<ProductDTO> seller_product_search_name(String seller_id,String product_search_value);
	public ProductDTO seller_product_out_detail(String seller_id,int product_number);
	public void seller_product_delete(String seller_id,int product_number);
	public void seller_product_update(ProductDTO dto);
	public ArrayList<ProductDTO> user_product_out();
	public int userproductcntnotice();
	public ArrayList<ProductDTO> userproductnotice(PageDTO dto);
	public ArrayList<ProductDTO> user_product_detail(int product_number);
	public ArrayList<ProductDTO> user_product_cart_view_data(int memeber_number);
	public ProductDTO get_product_info(int product_number);
	public void product_sell_amount_update(String productNumber,int quantity);
	public ArrayList<ProductDTO> user_product_order(int product_number);
	public ArrayList<ProductDTO> product_cart_view(String product_number);
	public ArrayList<ProductDTO> product_buy_cart(String product_number);
	//장바구니 구매 시 상품 정보를 결제 페이지로 이동 시켜 출력
	public ProductDTO cart_buy_view(String product_number);
	//바로 결제
	public void order_buy_amount_updown(int product_number);
	//장바구니에서 결제
	public void order_buy_amount_updown_cart(String product_number,String product_Quantities);
	public ArrayList<ProductDTO> product_list();
	public void product_list_delete(String parameter);
	public String product_seller_id(String product_number);
	public String product_product_name(String product_number);
	public void product_review_count(int product_number);
	public void seller_product_exit(String seller_id);
	public void sell_amount_rollback(int product_number,int product_sell_amount);
}
