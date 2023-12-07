package com.spring.myweb.sclmain.entity;

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
public class Place {
	
	private int bno;
	private String name;
	private String address;
	private String raddress;
	private String phone;
	private String memberId;
	private LocalDateTime regDate;
	private int num;

}

