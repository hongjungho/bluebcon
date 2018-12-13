package com.spring.myapp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.ProductDao;

@Repository("productDao")
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
    private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

	
	@Override
	public List<String> selectMenuList() {
		
		return sqlSession.selectList("selectMenuList");
	}


	@Override
	public List<Map<String,Object>> selectProductList(Map<String,Object> requstMap) {
		
		return sqlSession.selectList("selectProductList", requstMap);
	}


	@Override
	public Object selectCompanyList() {
		
		return sqlSession.selectList("selectCompanyList");
	}


	@Override
	public Object ajaxSelect(Map<String, Object> requstMap) {
		
		return sqlSession.selectList("ajaxSelect",requstMap);
	}



}
