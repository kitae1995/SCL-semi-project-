package com.spring.myweb.sclboard.mapper;

import java.util.List;

import com.spring.myweb.sclboard.dto.page.Page;
import com.spring.myweb.sclboard.entity.SclBoard;

public interface ISclBoardMapper {
	
	//글 등록
	void regist(SclBoard SclBoard);
	
	//글 목록
	List<SclBoard> getList(Page page);
	
	//총 게시물 개수 구하기
	int getTotal(Page page);
	
	//상세보기
	SclBoard getContent(int bno);
	
	//수정
	void update(SclBoard SclBoard);
	
	//삭제
	void delete(int bno);
}
