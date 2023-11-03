package com.spring.myweb.sclboard.dto.response;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.spring.myweb.sclboard.entity.SclBoard;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString @EqualsAndHashCode
public class SclDetailResponseDTO {
	
	private int bno;
	private String title;
	private String writer;
	private String content;
	private String date;
	
	public SclDetailResponseDTO(SclBoard board) {
		this.bno = board.getBno();
		this.title = board.getTitle();
		this.writer = board.getWriter();
		this.content = board.getContent();
		if(board.getUpdateDate() == null) {
			this.date = SclListResponseDTO.makePrettierDateString(board.getRegDate());
		} else {
			this.date 
			= SclListResponseDTO.makePrettierDateString(board.getUpdateDate()) + " (수정됨)";
		}
	}

}















