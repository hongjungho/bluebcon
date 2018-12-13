package com.spring.myapp.dao;

import java.util.List;
import java.util.Map;

public interface ProductDao {


	public List<String> selectMenuList();

	public List<Map<String,Object>> selectProductList(Map<String,Object> requstMap);

	public Object selectCompanyList();

	public Object ajaxSelect(Map<String, Object> requstMap);

				
}       
     