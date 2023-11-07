package com.spring.myweb.scluser.mapper;

import com.spring.myweb.scluser.entity.SclUser;

public interface ISclUserMapper {
		//아이디 중복 확인
		int idCheck(String id);
		
		//회원 가입
		void join(SclUser scl);
		
		//로그인
		//아이디를 통해 pw를 조회하는 메서드
		String login(String id);
		
		//회원 정보 얻어오기
		SclUser getInfo(String id);
		
		//회원 정보 수정
		void updateUser(SclUser scl);
		
}
