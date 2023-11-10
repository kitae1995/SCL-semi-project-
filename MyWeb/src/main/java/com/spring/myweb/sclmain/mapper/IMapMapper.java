package com.spring.myweb.sclmain.mapper;

import java.util.List;

import com.spring.myweb.freeboard.dto.page.Page;
import com.spring.myweb.sclmain.entity.Place;

public interface IMapMapper {

	
//	List<Place> selectLikePlace(Integer startIndex, Integer rowPerPage, String userId);
	
//	Integer countAll(String userId);
	
//	int selectMapList(String userId,String address);
	
	void insertMapList(Place place);
	
	//글 목록
	List<Place> getList(Page page);
		
	//총 게시물 개수 구하기
	int getTotal(Page page);
	
	//삭제하기
	void delete(int bno);
	
	
}
