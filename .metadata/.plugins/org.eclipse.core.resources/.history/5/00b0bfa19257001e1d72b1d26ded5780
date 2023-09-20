package com.spring.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CoffeeController_RE {

	@GetMapping("/coffee/order2")
	public String coffeeorder2() {
		System.out.println("커피 주문 요청이 들어왔습니다!");
		return "/response/coffee-form2";
	}
	
	//주문하기 버튼을 누르면 나오는 결과창
	
	@PostMapping("/coffee/result2")
	public String coffeeResult2(String menu, int price , Model model) {
		System.out.println("계산서 요청이 들어왔습니다!");
		
		model.addAttribute("m",menu);
		model.addAttribute("p",price);
		return "/response/coffee-result2";
	}
}
