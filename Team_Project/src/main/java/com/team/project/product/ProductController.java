package com.team.project.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

	@RequestMapping(value = "/seller_product_join")
	public String seller_product_join()
	{
		return "seller_product_join";
	}

}
