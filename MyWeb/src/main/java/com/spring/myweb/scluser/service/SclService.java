package com.spring.myweb.scluser.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.myweb.scluser.dto.SclInfoResponseDTO;
import com.spring.myweb.scluser.dto.SclJoinRequestDTO;
import com.spring.myweb.scluser.entity.SclUser;
import com.spring.myweb.scluser.mapper.ISclUserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SclService {

	private final ISclUserMapper mapper;
	private final BCryptPasswordEncoder encoder;

	public int idCheck(String account) {
		return mapper.idCheck(account);
	}

	public void join(SclJoinRequestDTO dto) {
		System.out.println("암호화 하기 전 비번: " + dto.getSclPw());
		String securePw = encoder.encode(dto.getSclPw());
		System.out.println("암호화 후 비번: " + securePw);
		dto.setSclPw(securePw);

		SclUser scl = SclUser.builder()
				.sclId(dto.getSclId())
				.sclPw(dto.getSclPw())
				.sclName(dto.getSclName())
				.sclPhone1(dto.getSclPhone1())
				.sclPhone2(dto.getSclPhone2())
				.sclEmail1(dto.getSclEmail1())
				.sclEmail2(dto.getSclEmail2())
				.addrBasic(dto.getAddrBasic())
				.addrDetail(dto.getAddrDetail())
				.addrZipNum(dto.getAddrZipNum())
				.build();
		mapper.join(scl);
	}

	public String login(String sclId, String sclPw) {
		String dbPw = mapper.login(sclId);
		if (dbPw != null) {
			if (encoder.matches(sclPw, dbPw)) {
				return sclId;
			}
		}
		return null;
	}

	public SclInfoResponseDTO getInfo(String id) {
		SclUser scl = mapper.getInfo(id);
		return SclInfoResponseDTO.toDTO(scl);
	}

	public void updateUser(SclJoinRequestDTO dto) {
		System.out.println("암호화 하기 전 비번: " + dto.getSclPw());
		String securePw = encoder.encode(dto.getSclPw());
		System.out.println("암호화 후 비번: " + securePw);
		dto.setSclPw(securePw);

		SclUser scl = SclUser.builder()
				.sclPw(dto.getSclPw())
				.sclName(dto.getSclName())
				.sclPhone1(dto.getSclPhone1())
				.sclPhone2(dto.getSclPhone2())
				.sclEmail1(dto.getSclEmail1())
				.sclEmail2(dto.getSclEmail2())
				.addrBasic(dto.getAddrBasic())
				.addrDetail(dto.getAddrDetail())
				.addrZipNum(dto.getAddrZipNum())
				.build();
		mapper.updateUser(scl);
	}
}













