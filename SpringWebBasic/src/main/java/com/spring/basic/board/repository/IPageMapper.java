package com.spring.basic.board.repository;

import java.util.List;

import com.spring.basic.board.entity.Page;

public interface IPageMapper {
	
	//게시글 등록
	void insertPage(Page page);
	//게시글 보기(전체)
	List<Page> getcontents();
	//게시글 상세보기
	Page getcontent(int bno);
	//게시글 수정
	void updatePage(Page page);
	//게시글 삭제
	void deletePage(int bno);
}	
