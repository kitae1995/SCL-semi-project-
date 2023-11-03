package com.spring.myweb.sclboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.myweb.sclboard.dto.page.Page;
import com.spring.myweb.sclboard.dto.request.SclModifyRequestDTO;
import com.spring.myweb.sclboard.dto.request.SclRegistRequestDTO;
import com.spring.myweb.sclboard.dto.response.SclDetailResponseDTO;
import com.spring.myweb.sclboard.dto.response.SclListResponseDTO;
import com.spring.myweb.sclboard.entity.SclBoard;
import com.spring.myweb.sclboard.mapper.ISclBoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SclBoardService implements ISclBoardService {

	private final ISclBoardMapper mapper;
	
	@Override
	public void regist(SclRegistRequestDTO dto) {
		mapper.regist(SclBoard.builder()
				.title(dto.getTitle())
				.content(dto.getContent())
				.writer(dto.getWriter())
				.build());

	}

	@Override
	public List<SclListResponseDTO> getList(Page page) {
		List<SclListResponseDTO> dtoList = new ArrayList<>();
		List<SclBoard> list = mapper.getList(page);
		for(SclBoard board : list) {
			dtoList.add(new SclListResponseDTO(board));
		}
		return dtoList;
	}
	
	@Override
	public int getTotal(Page page) {
		return mapper.getTotal(page);
	}

	@Override
	public SclDetailResponseDTO getContent(int bno) {
		SclBoard board = mapper.getContent(bno);
		return new SclDetailResponseDTO(board);
	}

	@Override
	public void update(SclModifyRequestDTO freeboard) {
//		FreeBoard board = mapper.getContent(bno);
		mapper.update(SclBoard.builder()
				.title(freeboard.getTitle())
				.content(freeboard.getContent())
				.bno(freeboard.getBno())
				.build());	
		

	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub

	}

}
