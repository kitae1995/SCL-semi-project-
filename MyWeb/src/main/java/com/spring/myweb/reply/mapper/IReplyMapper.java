package com.spring.myweb.reply.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.myweb.freeboard.dto.page.Page;
import com.spring.myweb.reply.entity.Reply;

public interface IReplyMapper {
	
	void replyRegist(Reply reply);//댓글 등록
	
	/*
	 - MyBatis로 DB연동을 진행할 때, 파라미터 값이 2개 이상일 때 그냥 보내시면
	 에러가 발생하기 때문에 조치가 필요합니다.
	 
	 1. @Param을 이용해서 이름을 붙여주는 방법. (mapper.xml에서 해당 값을 지목할 수 있는 이름 붙이기)
	 
	//List<Reply> getList(@Param("boardNo")int bno , @Param("paging")Page page);//목록 요청 ( mybatis는 근데 변수 2개 못받음 ) 
	
	2.Map으로 포장해서 보내는 방법 // List<Reply> getList(Map<String, Object> data); ,서비스가서 map 만들어주면됨
	3.클래스를 디자인해서 객체 하나만 매개값으로 보내는 방법.
	
	중 하나를 상황에 맞게 적절하게 사용
	*/
	
	List<Reply> getList(Map<String, Object> data); // 목록 요청
	int getTotal(int bno);//댓글 개수(페이징,PageCreator는 사용하지 않습니다(비동기방식으로 사용하는 방식으로 연출)
	
	String pwCheck(int rno);//비밀번호 확인
	void update(Reply reply);//댓글 수정
	void delete(int rno);//댓글 삭제
	
}
