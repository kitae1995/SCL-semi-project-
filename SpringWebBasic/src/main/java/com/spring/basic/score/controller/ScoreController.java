package com.spring.basic.score.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.basic.score.dto.ScoreRequestDTO;
import com.spring.basic.score.service.ScoreService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/score")
@RequiredArgsConstructor //: final 필드가 존재한다면 그것을 초기화해주는 생성자
public class ScoreController {
	
	
	private final ScoreService service;
	
	// 만약에 클래스의 생성자가 단 1개라면
	// 자동으로 @Autowired를 작성해줌.
	// 뭐 나중에 jService , mService 이렇게 여러개가 있을수 있는데
	// 거기 전부다 @Autowried를 작성해주면 가독성이 떨어지니
	// 생성자가 한개인 service는 생략해도됨 // 각 service 앞에 final을 붙이고 @RequiredAr~~를 위에 선언해주면
	
	//1. 성적 등록 화면 띄우기 + 정보 목록 조회
	@GetMapping("/list")
	public String list() {
		
		return "score/score-list";
	}
	
	//2. 성적 정보 등록 처리 요청.
	@PostMapping("/register")
	public String register(ScoreRequestDTO dto) {
		//단순 입력 데이터 확인해보기
		System.out.println("/score/register : POST ! - " + dto);
		
		//서비스한테 일 시키기
		//service.insertScore(dto);	
		
		
		return null;
	}
	
	
	
	
}
