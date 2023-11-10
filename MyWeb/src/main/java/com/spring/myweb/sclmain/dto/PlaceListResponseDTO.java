package com.spring.myweb.sclmain.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.spring.myweb.sclmain.entity.Place;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

// 클라이언트 측으로 게시글 목록을 줄 때의 스펙 정의.
@Getter @ToString @EqualsAndHashCode
public class PlaceListResponseDTO {
	
	private int bno;
	private String name;
	private String address;
	private String phone;
	private String regdate;
	

	public PlaceListResponseDTO(Place place) {
		super();
		this.bno = place.getBno();
		this.name = place.getName();
		this.address = place.getAddress();
		this.phone = place.getPhone();
		this.regdate = makePrettierDateString(place.getRegDate());
		
	}

	static String makePrettierDateString(LocalDateTime regDated) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		return dtf.format(regDated);
	}
	}





	

