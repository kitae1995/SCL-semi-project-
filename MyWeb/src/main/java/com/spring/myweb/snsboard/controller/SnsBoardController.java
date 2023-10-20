package com.spring.myweb.snsboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.myweb.snsboard.service.SnsBoardService;

import lombok.RequiredArgsConstructor;

@RestController // 비동기가 주가 될거같으면 붙이는 아노테이션
@RequestMapping("/snsboard")
@RequiredArgsConstructor
public class SnsBoardController {

	private final SnsBoardService service;
	
	@GetMapping("/snsList") // @RestController를 붙였기에 원래 viewResolver인 void로는 안되고 Modelandview를 붙여줘야함
							// 아니면 위에 @RestController를 그냥 @controller로 바꾸고
							// 비동기를 쓸 @mapping에 일일이 @responsebody 아노테이션을 붙여주면 원래처럼 할수있음
	public ModelAndView snsList() {
		ModelAndView mv = new ModelAndView();
//		mv.addObject("name","value");
		mv.setViewName("snsboard/snsList");
		return mv;
	}
	
}
