package com.spring.myweb.sclboard.service;

import java.util.List;

import com.spring.myweb.sclboard.dto.page.Page;
import com.spring.myweb.sclboard.dto.request.SclModifyRequestDTO;
import com.spring.myweb.sclboard.dto.request.SclRegistRequestDTO;
import com.spring.myweb.sclboard.dto.response.SclDetailResponseDTO;
import com.spring.myweb.sclboard.dto.response.SclListResponseDTO;

public interface ISclBoardService {

		//글 등록
		void regist(SclRegistRequestDTO dto);
		
		//글 목록
		List<SclListResponseDTO> getList(Page page);
		
		//총 게시물
		int getTotal(Page page);
		
		//상세보기
		SclDetailResponseDTO getContent(int bno);
		
		//수정
		void update(SclModifyRequestDTO dto);
		
		//삭제
		void delete(int bno);

		

		
	
}
