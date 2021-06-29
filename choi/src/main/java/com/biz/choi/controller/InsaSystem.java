package com.biz.choi.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller 
@RequestMapping("/insaSystem")
public class InsaSystem {	
	
	//메인페이지
	@RequestMapping("insaMain.biz")
	public ModelAndView insaMain(ModelAndView mv) {
		
		mv.setViewName("insaSystem/insaMain");
		return mv;
	}
	
	
	//입력페이지
	@RequestMapping("insaAdd.biz")
	public ModelAndView insaAdd(ModelAndView mv) {
		
		mv.setViewName("insaSystem/insaAdd");
		return mv;
	}
	
	
	
}
