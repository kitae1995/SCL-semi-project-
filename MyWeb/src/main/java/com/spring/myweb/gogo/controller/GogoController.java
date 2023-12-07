package com.spring.myweb.gogo.controller;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.myweb.gogo.entity.Gogo;
import com.spring.myweb.gogo.service.GogoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RestController
@RequestMapping("/gogo")
@RequiredArgsConstructor
@Slf4j
public class GogoController {
	
	private final GogoService service;
	
	//카테고리 설정
	@GetMapping("content/{num}")
	public List<Gogo> getDetail(@PathVariable String num) {
		log.info(num);
//		service.getKate();
		return service.getDetail(num);
//		return null;
	}
	
	
	//카테고리 설정
	@GetMapping("maker/{kate}")
	public List<Gogo> getKate(@PathVariable String kate) {
		log.info(kate);
//		service.getKate(kate);
		return service.getKate(kate);
//		return null;
	}
	
}
