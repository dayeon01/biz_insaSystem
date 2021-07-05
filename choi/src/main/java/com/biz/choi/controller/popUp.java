package com.biz.choi.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/popup")
public class popUp {

	@RequestMapping("/jusoPopup.biz")
	public ModelAndView jusoPopup(ModelAndView mv) {
		
			mv.setViewName("popup/jusoPopup");
		return mv;
	}
}
