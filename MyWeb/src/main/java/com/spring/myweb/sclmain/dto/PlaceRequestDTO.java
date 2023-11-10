package com.spring.myweb.sclmain.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter @Setter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PlaceRequestDTO {
	
	private int bno;
	private String name;
	private String address;
	private String phone;
	private String memberId;
	private LocalDateTime regDate;

}

