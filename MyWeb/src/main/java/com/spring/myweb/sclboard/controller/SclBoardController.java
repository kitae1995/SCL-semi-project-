package com.spring.myweb.sclboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.myweb.sclboard.dto.page.Page;
import com.spring.myweb.sclboard.dto.page.PageCreator;
import com.spring.myweb.sclboard.dto.request.SclModifyRequestDTO;
import com.spring.myweb.sclboard.dto.request.SclRegistRequestDTO;
import com.spring.myweb.sclboard.service.ISclBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/sclboard")
@RequiredArgsConstructor
public class SclBoardController {
	
	private final ISclBoardService service;
	
	//페이징이 들어간 목록 화면
	@GetMapping("/SclList")
	public void freeList(Page page, Model model) {
		System.out.println("/Sclboard/SclList: GET!");
		PageCreator creator;
		int totalCount = service.getTotal(page);
		if(totalCount == 0) {
			page.setKeyword(null);
			page.setCondition(null);
			creator = new PageCreator(page, service.getTotal(page));
			model.addAttribute("msg", "searchFail");
		} else {
			creator = new PageCreator(page, totalCount);			
		}
		
		model.addAttribute("boardList", service.getList(page));
		model.addAttribute("pc", creator);
	}
	
	//글쓰기 페이지를 열어주는 메서드
	@GetMapping("/SclRegist")
	public void regist() {}
	
	//글 등록 처리
	@PostMapping("/SclRegist")
	public String regist(SclRegistRequestDTO dto) {
		service.regist(dto);
		return "redirect:/Sclboard/SclList";
	}
	
	//글 상세보기 처리
	@GetMapping("/content")
	public String getContent(int bno, 
							Model model, 
							@ModelAttribute("p") Page page) {
		model.addAttribute("article", service.getContent(bno));
		return "Sclboard/SclDetail";
	}
	
	//글 수정 페이지 이동 요청
	@PostMapping("/modPage")
	public String modPage(@ModelAttribute("article") SclModifyRequestDTO dto) {
		return "Sclboard/SclModify";
	}
	
	//글 수정 요청
	@PostMapping("/modify")
	public String modify(SclModifyRequestDTO dto) {
		service.update(dto);
		return "redirect:/Sclboard/content?bno=" + dto.getBno();
	}
	
	//글 삭제 요청
	@PostMapping("/delete")
	public String delete(int bno) {
		service.delete(bno);
		return "redirect:/Sclboard/SclList";
	}
	
	

}












