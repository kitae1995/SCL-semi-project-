package com.spring.myweb.scluser.dto;

import java.util.ArrayList;
import java.util.List;

import com.spring.myweb.sclboard.dto.response.SclListResponseDTO;
import com.spring.myweb.sclboard.entity.SclBoard;
import com.spring.myweb.scluser.entity.SclUser;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter @ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SclInfoResponseDTO {
	
	private String sclName;
	private String sclPhone1;
	private String sclPhone2;
	private String sclEmail1;
	private String sclEmail2;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;
	
	private List<SclListResponseDTO> SclBoardList;
	
	public static SclInfoResponseDTO toDTO(SclUser scl) {
		List<SclListResponseDTO> list = new ArrayList<>();
		for(SclBoard board : scl.getSclBoardList()) {
			list.add(new SclListResponseDTO(board));
		}	
		
		return SclInfoResponseDTO.builder()
								.sclName(scl.getSclName())
								.sclPhone1(scl.getSclPhone1())
								.sclPhone2(scl.getSclPhone2())
								.sclEmail1(scl.getSclEmail1())
								.sclEmail2(scl.getSclEmail2())
								.addrBasic(scl.getAddrBasic())
								.addrDetail(scl.getAddrDetail())
								.addrZipNum(scl.getAddrZipNum())
								.SclBoardList(list)
								.build();
	}
	
	

}









