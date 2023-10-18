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
}
