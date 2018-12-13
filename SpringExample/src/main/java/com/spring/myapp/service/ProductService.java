package com.spring.myapp.service;

import java.util.List;
import java.util.Map;

public interface ProductService {



	public List<String> menuList();

	public List<Map<String,Object>> productList(Map<String,Object> requstMap);

	public Object companyList();
	public Object ajaxSelect(Map<String,Object> requstMap);


	

	

}
