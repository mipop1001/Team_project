package com.team.project.product;

import java.util.ArrayList;

public interface ProductService {

	public void seller_product_join_save(ProductDTO dto);
	public ArrayList<ProductDTO> seller_product_out(String seller_id);
	public ArrayList<ProductDTO> seller_product_search_number(String seller_id,String product_search_value);
	public ArrayList<ProductDTO> seller_product_search_name(String seller_id,String product_search_value);
	public ProductDTO seller_product_out_detail(String seller_id,int product_number);
	public void seller_product_delete(String seller_id,int product_number);
	public void seller_product_update(ProductDTO dto);
}
