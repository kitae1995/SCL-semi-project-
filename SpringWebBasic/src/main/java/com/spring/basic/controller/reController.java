package com.spring.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.basic.model.UserVO2;



@Controller
public class reController {
	
	@RequestMapping("/retest")
	public String ReTest() {
		System.out.println("retest가 호출되었습니다");
		return "/request/req-ex01";
	}

	@GetMapping("/retest2")
	public String ReTestGet() {
		System.out.println("GET 방식이 호출되었습니다");
	    return "/request/req-ex01";
	}
	
	@PostMapping("/retest2")
	public String ReTestPost() {
		System.out.println("Post 방식이 호출되었습니다");
	    return "/request/req-ex01";
	}
	
	@GetMapping("/request/join2")
	public void ReTestjoin() {
		System.out.println("화면 출력");
	}
	
	@PostMapping("/request/join2")
	public void ReTestjoin(UserVO2 vo2) {
		System.out.println(vo2);
	}
	

}
