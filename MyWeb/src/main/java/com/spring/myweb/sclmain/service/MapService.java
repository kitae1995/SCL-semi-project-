package com.spring.myweb.sclmain.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.myweb.sclmain.mapper.IMapMapper;
import com.spring.myweb.snsboard.mapper.ISnsBoardMapper;

public class MapService {
	
	private final IMapMapper mapper;
	
	// 찜 목록 가져오기, 페이지네이션
	public Map<String, Object> likeplace (Integer page, String userId) {
		
	Integer rowPerPage = 5;
	
	Integer startIndex = (page-1)* rowPerPage;
	
	Integer numOfRecords = mapper.countAll(userId);
	// 마지막 페이지 번호
	Integer lastPageNumber = (numOfRecords-1)/ rowPerPage +1;
	// 페이지네이션 왼쪽 번호
	Integer leftPageNum = page - 5;
	// 1보다 작을 수 없음
	leftPageNum = Math.max(leftPageNum, 1);
	// 페이지네이션 오른쪽 번호
	Integer rightPageNum = leftPageNum +9;
	// 마지막 페이지보다 클 수 없음
	rightPageNum = Math.min(rightPageNum, lastPageNumber);
	
	Map<String, Object> pageInfo = new HashMap<>();
	pageInfo.put("rightPageNum", rightPageNum);
	pageInfo.put("LeftPageNum", leftPageNum);
	pageInfo.put("currentPageNum", page);
	pageInfo.put("lastPageNum", lastPageNumber);
	List<Place> list = mapper.selectLikePlace (startIndex, rowPerPage, userId); return Map. of("mapList", list,
	"pageInfo", pageInfo);
	}
	
	//찜한 장소 중복확인
	public int selectMapList(String userId,String address) {
		return mapper.selectMapList(userId,address);
	}
	
	//찜한 장소 추가
	public void insertMapList(Place place) {
		mapper.insertMapList(place);
	}
	
	
	
}
