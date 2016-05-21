package com.jiuji.cn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiuji.cn.service.HomePageService;

import javacommon.base.CommonController;

@Controller
@RequestMapping("/homePageCtrl")
public class HomePageCtrl  extends CommonController{

	@Autowired
	HomePageService homePageService;
	
	@RequestMapping("/toTop")
	public String top(){
		return "/modules/homemain/top";
	}
	
	@RequestMapping("/toLeft")
	public String left(){ 
		return "/modules/homemain/left";
	}
	
	@RequestMapping("/toRight")
	public String right(){
		return "/modules/homemain/right";
	}
	
	@RequestMapping("/toBottom")
	public String bottom(){
		return "/modules/homemain/bottom";
	}
	
	@RequestMapping("/toHeader")
	public String header(){
		return "/commons/header";
	}
	
	@RequestMapping("/toFooter")
	public String footer(){
		return "/commons/footer";
	}
	
	@RequestMapping("/toRegister")
	public String register(){
		return "/modules/homepage/register";
	}
	
	/**
	 * 主页 获取分类信息，
	 * @return
	 */
	@RequestMapping("/toHomePage")
	public String homePage(Model model,HttpSession session){
		homePageService.queryInfomation(model,session);
		return "/modules/homepage/homepage";
	}
	
}