package com.spring.myapp.domain;

import java.util.List;
import java.util.Map;

public class ProductList{
	
	private List<Map<String, Object>> productList;
	
	public List<Map<String, Object>> getProductList() {
		return productList;
	}
	public void setProductList(List<Map<String, Object>> productList) {
		this.productList = productList;
	}
	
}
