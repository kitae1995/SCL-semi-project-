package com.spring.myweb.sclmain.mapper;

import java.util.List;

public interface IMapMapper {

	
	List<Place> selectLikePlace(Integer startIndex, Integer rowPerPage, String userId);
	
	Integer countAll(String userId);
	
	int selectMapList(String userId,String address);
	
	void insertMapList(Place place);
}
