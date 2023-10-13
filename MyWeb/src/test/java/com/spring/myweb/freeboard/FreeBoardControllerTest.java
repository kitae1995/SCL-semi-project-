package com.spring.myweb.freeboard;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.spring.myweb.freeboard.controller.FreeBoardController;
import com.spring.myweb.freeboard.dto.response.FreeDetailResponseDTO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
					,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@WebAppConfiguration //어플리케이션 컨텍스트의 웹 버전을 생성하는 데 사용하는 이노테이션
public class FreeBoardControllerTest {
	
	/*
    - 테스트 환경에서 가상의 DispatcherServlet을 사용하기 위한 객체 자동 주입 
    - WebApplicationContext는 Spring에서 제공되는 servlet들을 사용할 수 있도록
    정보를 저장하는 객체입니다.
    */
	
	@Autowired
	private WebApplicationContext ctx; //컨테이너에 등록된 모든 빈을 사용할 때.
	
//	@Autowired
//	private FreeBoardController controller;  이 컨트롤러 하나만 테스트 할 때
	
	//MockMvc는 웹 어플래케이션을 서버에 배포하지 않아도 스프링 MVC 동작을 구현할 수 있는
	//가상의 구조를 만들어 줍니다.
	private MockMvc mockmvc;
	
	@BeforeEach // 테스트 시작 시 다른 메서드 실행 전에 항상 먼저 구동되는 기능을 선언.
	public void setup() {
		// 가상 구조 실제로 세팅
		// 스프링 컨테이너에 등록된 모든 빈과 의존성 주입까지 로드해서 사용이 가능.
		this.mockmvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		
//		테스트할 컨트롤러를 직접 주입. 하나의 컨트롤러만 테스트할때는 이렇게
//		this.mockmvc = MockMvcBuilders.standaloneSetup(controller).build();
	}
	
	@Test
	@DisplayName("/freeboard/freeList 요청 처리 과정 테스트")
	void testList() throws Exception {
		ModelAndView mv = mockmvc.perform(MockMvcRequestBuilders.get("/freeboard/freeList")) // 가상의 요청을 보냄
			   .andReturn() // 요청의 결과를 받음
			   .getModelAndView(); // 요청 결과에서 ModelAndView 객체를 얻음.
		
		//컨트롤러에서 model 객체에 담은 데이터를 확인
		System.out.println("Model 내의 저장한 데이터 : " + mv.getModelMap());
		//컨트롤러에서 응답 페이지로 지정한 문자열을 확인
		System.out.println("응답 처리를 위해 사용할 페이지 : " + mv.getViewName());
	}
	
	@Test
	@DisplayName("게시글 등록 완료 후 목록 재요청이 일어날 것이다.")
	void testInsert() throws Exception {
		String viewName =  mockmvc.perform(MockMvcRequestBuilders.post("/freeboard/freeRegist")
											  .param("title","테스트 새 글 제목")
											  .param("content","테스트 새 글 내용")
											  .param("writer","user01")
						  ).andReturn().getModelAndView().getViewName();
		
		assertEquals(viewName, "redirect:/freeboard/freeList");
	}
	
	@Test
	@DisplayName("3번 글 상세보기 요청을 넣으면 컨트롤러는 DB에서 가지고 온 글 객체를 model에 담아서"
			+ "freeDetail.jsp로 이동시킬 것이다.")
	void testContent() throws Exception {
		// /freeboard/content -> GET
		// bno,title,writer,content, updateDate	== null ? regdate,updateDate(수정됨)
		
		ModelAndView mv = mockmvc.perform(
				MockMvcRequestBuilders.get("/freeboard/content")
									  .param("bno", "3")
				).andReturn().getModelAndView();
		
		assertEquals("freeboard/freeDetail", mv.getViewName());
		FreeDetailResponseDTO dto = (FreeDetailResponseDTO) mv.getModelMap().get("article");
		System.out.println(dto);
		assertEquals(dto.getBno(), 3);
	}
	
	@Test
    @DisplayName("3번글의 제목과 내용을 수정하는 요청을 post방식으로 전송하면 수정이 진행되고, "
            + "수정된 글의 상세보기 페이지로 응답해야 한다.")
    // /freeboard/modify -> post
    void testModify() throws Exception {
	   String bno = "3";
       String viewname = mockmvc.perform(MockMvcRequestBuilders.post("/freeboard/modify")
        									  .param("title", "제목수정")
        									  .param("content", "내용수정")
        									  .param("bno", bno)
        			    ).andReturn().getModelAndView().getViewName();
        
        assertEquals(viewname,"redirect:/freeboard/content?bno=" + bno);
        
    }
    
    @Test
    @DisplayName("3번 글을 삭제하면 목록 재요청이 발생할 것이다.")
    // /freeboard/delete -> post
    void testDelete() throws Exception {
        assertEquals("redirect:/freeboard/freeList", 
        				mockmvc.perform(MockMvcRequestBuilders.post("/freeboard/delete")
        													  .param("bno","3")
        						).andReturn().getModelAndView().getViewName()
        				);
    }
	
	
}
