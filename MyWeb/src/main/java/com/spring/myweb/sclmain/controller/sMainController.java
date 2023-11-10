package com.spring.myweb.sclmain.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myweb.freeboard.dto.page.Page;
import com.spring.myweb.freeboard.dto.page.PageCreator;
import com.spring.myweb.sclmain.dto.PlaceRequestDTO;
import com.spring.myweb.sclmain.entity.Place;
import com.spring.myweb.sclmain.service.MapService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
@RequestMapping("/sclmain")
@Slf4j
public class sMainController {
	
	private final MapService service;
	
	@GetMapping("/s_main")
	public void stest() {}
//	
//	@GetMapping("/s_main2")
//	public void stest2() {}
	
	@GetMapping("/s_main3")
	public void stest3() {}
	
	@GetMapping("/mapMypage")
	public void mapMypage(Page page, Model model) {
		System.out.println("/sclmain/mapMypage: GET!");
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
	
//	//찜 목록
//	@GetMapping("mapMypage")
//	public void likePlace(Model model, Authentication authentication,
//			@RequestParam(value = "page", defaultValue = "1")Integer page) {
//		String apikey = "1aef10108def276437df95d26ab8399f";
//		model.addAttribute("apikey",apikey);
//		String userId = authentication.getName();
//		Map<String,Object> result = service.likeplace(page,userId);
//		model.addAllAttributes(result);
//	}

	 //찜하기
	@PostMapping("/addplace") 
	@ResponseBody
	public ResponseEntity<String> addplace(@RequestBody PlaceRequestDTO dto) { 
	
	try {
//		String id = reqObj.getMemberId();
//        String name = reqObj.getName();
//        String addr = reqObj.getAddress();
//        String tel = reqObj.getPhone();
        log.info("controller: {}", dto);
        service.insertMapList(dto);
        return new ResponseEntity<>("Data received successfully", HttpStatus.OK);
    } catch (Exception e) {
       
        return new ResponseEntity<>("Error processing data", HttpStatus.INTERNAL_SERVER_ERROR);
	}
		
		
	}
	
	//글 삭제 요청
		
		@GetMapping("/delete")
		public String delete(int bno) {
			service.delete(bno);
			
			return "redirect:/sclmain/mapMypage";
		}
//	}
	

	
	

}

	
	
	
	
	
	














