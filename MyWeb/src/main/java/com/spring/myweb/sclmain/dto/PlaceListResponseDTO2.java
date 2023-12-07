package com.spring.myweb.sclmain.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.spring.myweb.sclmain.entity.Place2;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

// 클라이언트 측으로 게시글 목록을 줄 때의 스펙 정의.
@Getter @ToString @EqualsAndHashCode
public class PlaceListResponseDTO2 {
	
	private int bno;
	private String name;
	private String phone;
	private String title;
	private String regdate;
	private String num;
	

	public PlaceListResponseDTO2(Place2 place2) {
		super();
		this.bno = place2.getBno();
		this.name = place2.getName();
		this.phone = place2.getPhone();
		this.title = place2.getTitle();
		this.regdate = makePrettierDateString(place2.getRegDate());
		this.num = place2.getNum();
		
	}

	static String makePrettierDateString(LocalDateTime regDated) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		return dtf.format(regDated);
	}
	}





	

