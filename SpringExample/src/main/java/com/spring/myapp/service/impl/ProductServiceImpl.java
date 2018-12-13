package com.spring.myapp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.myapp.dao.ProductDao;
import com.spring.myapp.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource(name="productDao")
	private ProductDao productDao;
	
	
	@Override
	public List<String> menuList() {
		
		return productDao.selectMenuList();
	}





	@Override
	public Object companyList() {
		
		return productDao.selectCompanyList();
	}


	@Override
	public List<Map<String, Object>> productList(Map<String, Object> requstMap) {
		return productDao.selectProductList(requstMap);
	}





	@Override
	public Object ajaxSelect(Map<String, Object> requstMap) {
		
		return productDao.ajaxSelect(requstMap);
	}



	
}
