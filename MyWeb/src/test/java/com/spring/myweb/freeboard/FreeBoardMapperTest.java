package com.spring.myweb.freeboard;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.spring.myweb.freeboard.dto.page.Page;
import com.spring.myweb.freeboard.entity.FreeBoard;
import com.spring.myweb.freeboard.mapper.IFreeBoardMapper;



@ExtendWith(SpringExtension.class) // 테스트 환경을 만들어 주는 Junit5 객체 로딩
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class FreeBoardMapperTest {
	
	@Autowired
	private IFreeBoardMapper mapper;
	
	//단위 테스트 (unit test) - 가장 작은 단위의 테스트 ( 기능별 테스트 -> 메서드별 테스트 )
	//테스트 시나리오
	//- 단언(Assertion) 기법
	
	@Test
	@DisplayName("Mapper 계층의 regist를 호출하면서 "
			+ "FreeBoard를 전달하면 데이터가 INSERT 될 것이다.")
	void registTest() {
		//given - when then 패턴을 따릅니다. (권장 사항)
		
		//given: 테스트를 위해 주어질 세팅(paratmeter) - 지금은 생략
		
		for(int i=1; i<270; i++) {
			//when : 테스트 실제 상황 세팅
//			FreeBoard board = FreeBoard.builder()
//					.title("테스트 제목 " + i)
//					.writer("abc1234")
//					.content("테스트 내용입니다. " + i)
//					.build(); -- 빌더 패턴
			mapper.regist(FreeBoard.builder()
					.title("테스트 제목 " + i)
					.writer("abc1234")
					.content("테스트 내용입니다. " + i)
					.build()); // 빌더 패턴 더 간략하게
		}
		
		//then: 테스트 결과를 확인.
	}
	
	@Test
	@DisplayName("조회 시 전체 글 목록이 올 것이고, 조회된 글의 개수는 10개일 것이다.")
	void getListTest() {
		
		//when
		List<FreeBoard> list = mapper.getList(new Page());
		for(FreeBoard board : list) {
			System.out.println(board);
		}
		System.out.println("조회된 글의 개수 : " + list.size());
		
		//then list의 개수가 10개가 아니라면 , 실패임 ( 오류가 남 )
		Assertions.assertEquals(list.size(), 10);
	}
	
	@Test
	@DisplayName("글 번호가 2번인 글을 조회하게 되면" + "글쓴이는 'abc1234'일 것이고, 글 내용은 '테스트 내용입니다.' 일 것이다.")
	void getContentTest() {
		
		//given
		int bno = 2;
		
		//when
		FreeBoard board = mapper.getContent(bno);
		
		//then
		Assertions.assertEquals(board.getWriter(), "abc1234");
		Assertions.assertTrue(board.getTitle().equals("테스트 제목 2"));
	
	}
	
	//글 번호가 1번인 글의 제목과 내용을 수정 후 다시 조회했을 때
	//수정한 제목과 내용으로 바뀌었음을 단언하세요.
	@Test
	@DisplayName("글 번호가 1번인 글의 제목과 내용을 수정 후 다시 조회했을 때\r\n"
			+ "	//수정한 제목과 내용으로 바뀌었음을 단언하세요.")
	void updateTest() {
		
		
		//given
		mapper.update(FreeBoard.builder()
				.title("수정")
				.content("내용 수정.")
				.build()); // 빌더 패턴 더 간략하게
		//when
		int bno = 1;
		FreeBoard board = mapper.getContent(bno);
		
		Assertions.assertEquals(board.getTitle(), "수정");
		Assertions.assertEquals(board.getContent(), "내용 수정.");
		
//		FreeBoard board = FreeBoard.builder()
//				.bno(1)
//				.title("수정")
//				.content("내용 수정.")
//				.build()
//		
//		mapper.update(board);
				
		
		
	}
	
	
	//글 번호가 2번인 글을 삭제한 후에 전체 목록을 조회했을 때
	//글의 개수가 11개일 것이고
	//2번 글을 조회했을 때 null이 리턴됨을 단언하세요. -> assertNull(객체)
	
	@Test
	@DisplayName("글 번호가 2번인 글을 삭제한 후에 전체 목록을 조회했을 때 ")
	
	void deleteTest() {
		//given
		int bno = 2;
		
		//when
		mapper.delete(bno);
		
		//then
//		Assertions.assertEquals(mapper.getList().size(), 26);
//		Assertions.assertNull(mapper.getContent(bno));
	}
		
}
