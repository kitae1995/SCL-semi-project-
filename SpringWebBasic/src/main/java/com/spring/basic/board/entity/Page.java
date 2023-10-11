package com.spring.basic.board.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Page {
	
	private int bno;
	private String writer;
	private String title;
	private String grade;
	private String content;
	private LocalDateTime regDate; 

}
