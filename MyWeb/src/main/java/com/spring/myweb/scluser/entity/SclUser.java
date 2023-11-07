package com.spring.myweb.scluser.entity;

import java.time.LocalDateTime;
import java.util.List;

import com.spring.myweb.sclboard.entity.SclBoard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE scls(
    scl_id VARCHAR2(50) PRIMARY KEY,
    scl_pw VARCHAR2(50) NOT NULL,
    scl_name VARCHAR2(50) NOT NULL,
    scl_phone1 VARCHAR2(50),
    scl_phone2 VARCHAR2(50),
    scl_email1 VARCHAR2(50),
    scl_email2 VARCHAR2(50),
    addr_basic VARCHAR2(300),
    addr_detail VARCHAR2(300),
    addr_zip_num VARCHAR2(50),
    reg_date DATE DEFAULT sysdate
);
 */

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SclUser {
	
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
	private LocalDateTime regDate;
	
	/*
	 한 명의 회원은 글을 여러 개 작성할 수 있습니다.
	 마이페이지에서는 특정 회원이 작성한 글 목록을 나타내야 합니다.
	 회원 정보와 글 목록은 서로 다른 테이블로 이루어져 있고, 마이페이지 에서는
	 해당 정보를 한 번의 DB 연동으로 가져올 수 있도록 하기 위해
	 JOIN 문법으로 테이블을 합친 뒤 원하는 컬럼을 선택해서 가져올 예정입니다. 
	 */
	
	//한 명의 회원(User)은 글(Freeboard)을 여러개 작성한다.
	private List<SclBoard> SclBoardList;
	

}













