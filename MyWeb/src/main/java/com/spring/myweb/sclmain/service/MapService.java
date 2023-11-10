package com.spring.myweb.sclmain.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.myweb.freeboard.dto.page.Page;
import com.spring.myweb.sclmain.dto.PlaceListResponseDTO;
import com.spring.myweb.sclmain.dto.PlaceRequestDTO;
import com.spring.myweb.sclmain.entity.Place;
import com.spring.myweb.sclmain.mapper.IMapMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MapService {
	
	private final IMapMapper mapper;
	
//	// 찜 목록 가져오기, 페이지네이션
//	public Map<String, Object> likeplace (Integer page, String userId) {
//		
//	Integer rowPerPage = 5;
//	
//	Integer startIndex = (page-1)* rowPerPage;
//	
//	Integer numOfRecords = mapper.countAll(userId);
//	// 마지막 페이지 번호
//	Integer lastPageNumber = (numOfRecords-1)/ rowPerPage +1;
//	// 페이지네이션 왼쪽 번호
//	Integer leftPageNum = page - 5;
//	// 1보다 작을 수 없음
//	leftPageNum = Math.max(leftPageNum, 1);
//	// 페이지네이션 오른쪽 번호
//	Integer rightPageNum = leftPageNum +9;
//	// 마지막 페이지보다 클 수 없음
//	rightPageNum = Math.min(rightPageNum, lastPageNumber);
//	
//	Map<String, Object> pageInfo = new HashMap<>();
//	pageInfo.put("rightPageNum", rightPageNum);
//	pageInfo.put("LeftPageNum", leftPageNum);
//	pageInfo.put("currentPageNum", page);
//	pageInfo.put("lastPageNum", lastPageNumber);
//	List<Place> list = mapper.selectLikePlace (startIndex, rowPerPage, userId); return Map. of("mapList", list,
//	"pageInfo", pageInfo);
//	}
//	
//	//찜한 장소 중복확인
//	public int selectMapList(String userId,String address) {
//		return mapper.selectMapList(userId,address);
//	}
	
	//찜한 장소 추가
	public void insertMapList(PlaceRequestDTO dto) {
		//mapper.insertMapList(place);
		mapper.insertMapList(Place.builder()
				.name(dto.getName())
				.address(dto.getAddress())
				.phone(dto.getPhone())
				.memberId(dto.getMemberId())
				.build());
	}
	
	public List<PlaceListResponseDTO> getList(Page page) {
		List<PlaceListResponseDTO> dtoList = new ArrayList<>();
		List<Place> list = mapper.getList(page);
		for(Place place : list) {
			dtoList.add(new PlaceListResponseDTO(place));
		}
		return dtoList;
	}
	
	public int getTotal(Page page) {
		return mapper.getTotal(page);
	}
	
	public void delete(int bno) {
		mapper.delete(bno);

	}
	
	
	
}
