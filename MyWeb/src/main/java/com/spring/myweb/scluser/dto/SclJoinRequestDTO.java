package com.spring.myweb.scluser.dto;

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
public class SclJoinRequestDTO {
	
	private String sclId;
	private String sclPw;
	private String sclName;
	private String sclPhone1;
	private String sclPhone2;
	private String sclEmail1;
	private String sclEmail2;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;

}
