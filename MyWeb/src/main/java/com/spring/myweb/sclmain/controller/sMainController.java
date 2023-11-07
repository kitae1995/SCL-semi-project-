package com.spring.myweb.sclmain.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.spring.myweb.snsboard.service.SnsBoardService;

@Controller
@RequestMapping("/sclmain")
public class sMainController {
	
	//private final MapService service;
	
	@GetMapping("/s_main")
	public void stest() {}
	
	@GetMapping("/s_main2")
	public void stest2() {}
	
	@GetMapping("/s_main3")
	public void stest3() {}
	
	@GetMapping("mapMypage")
	public void mapMypage() {}
	
//	//찜 목록
//	@GetMapping("mapMypage")
//	public void likePlace(Model model, Authentication authentication,
//			@RequestParam(value = "page", defaultValue = "1")Integer page) {
//		String apikey = "1aef10108def276437df95d26ab8399f";
//		model.addAttribute("apikey",apikey);
//		String userId = authentication.getName();
//		Map<String,Object> result = service.likeplace(page,userId);
//		model.addAllAttributes(result);

	// 찜하기
//	@PostMapping("addPlace") 
//	@ResponseBody
//	public ResponseEntity<String> bookAccept (@RequestBody Place place, Authentication authentication) { 
//		if (authentication == null) {
//	return ResponseEntity.ok()
//			.body("로그인 후 이용하실 수 있습니다.");
//	}else {
//	
//	String userId = authentication.getName();
//	String address = place.getAddress();
//	//테이블에 해당 찜 가게가 있는지 조회 service int check = mapService.selectMapList (userId, address); if(check != 0) {
//	return ResponseEntity.ok()
//			.body("이미 찜한 곳 입니다.");
//	} else {
//	place.setMemberId(userId);
//	mapService.insertMapList(place); return ResponseEntity.ok()
//	.body("찜 완료!");
//	}
//	}
	}
	
	
	
	
	
	














