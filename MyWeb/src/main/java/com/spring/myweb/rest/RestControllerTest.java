package com.spring.myweb.rest;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

//@Controller
@RestController
@RequestMapping("/rest")
public class RestControllerTest {

	@GetMapping("/view")
	public String viewPage() {
		return "test/test1";
	}
	
	/*
	 * @RequestBody
	 * - 클라이언트 쪽에서 전송하는 JSON 데이터를
	 * 서버에서 사용하는 자바 언어에 맞게 변환하여 받을 수 있는 아노테이션.
	 * 비동기 통신에서 주로 사용
	 */
	
	/*
	 * @ResponseBody
	 * - 메서드가 리턴하는 데이터를 viewResolver에게 전달하지 않고
	 * 클라이언트에게 해당 데이터를 바로 응답하게 함
	 * 
	 * @Restcontroller를 메인 아노테이션을 등록하면 생략가능
	 * (이 방식을 사용하면 근데 모든 객체가 responsebody가 붙은거나 다름이 없어서
	 * 전부 비동기 방식 객체가 됨
	 */
	
	@PostMapping("/object")
	@ResponseBody
	public Person object(@RequestBody Person p) {
		System.out.println("비동기 방식의 요청이 들어옴");
		System.out.println(p.toString());
		
		p.setName("변경이름");
		p.setAge(100);
		
		return p;
 	}
		// 비동기 방식이기때문에 요청을 보내도 그 페이지 그대로 있기 때문에
		// 여태 했던 spirng처럼 view로 만든 홈페이지로 요청을 보내는게 아닌
		// 요청을 보낸 객체를 한번더 리턴해서 그대로 새로고침함
		// (근데 쓰려면 @RequestBody 아노테이션 붙여줘야함 
	
	@GetMapping("/hello")
	@ResponseBody
	public String hello() {
		return "hello world!";
	}
	
	@GetMapping("/hobby")
	@ResponseBody
	public List<String> hobby(){
		return Arrays.asList("축구","영화감상","수영");
	}
	
	
	@GetMapping("/study")
	public Map<String, Object> study(){
		Map<String, Object> subject = new HashMap<>();
		subject.put("자바", "java");
		subject.put("jsp", "java server pages");
		subject.put("spring", "spring framework");
		
		return subject;
	}
	
}
