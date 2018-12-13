package com.spring.myapp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myapp.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	@RequestMapping(value={"/product/productList.do","/"})
	public String ProductList(HttpServletRequest request,Model model,@RequestParam Map<String,Object> requstMap) {
		
		String[] companys =request.getParameterValues("companyName");
		
		requstMap.put("companys", companys);
		
		model.addAttribute("menuList",productService.menuList()); // 메뉴 상단
		model.addAttribute("companyList",productService.companyList()); // 회사목록
		productService.ajaxSelect(requstMap);
		model.addAttribute("searchResult",requstMap);
		return "main2";

	}
	
	@RequestMapping(value="/product/productSearchList.do")
	@ResponseBody
	public Object SearchList(HttpServletRequest request, @RequestParam Map<String,Object> requstMap) {
		String[] companys = request.getParameterValues("companys");
		requstMap.put("companyName",companys);
		return productService.ajaxSelect(requstMap);
	}

}
