package com.spring.myweb.gogo.mapper;

import java.util.List;
import java.util.Map;

import com.spring.myweb.freeboard.dto.page.Page;
import com.spring.myweb.gogo.dto.GogokateDTO;
import com.spring.myweb.gogo.entity.Gogo;

public interface IGogoMapper {
		//목록
		List<Gogo> getList(Page page);
		
		//상세
		List<Gogo> getDetail(String num);
		
		//특정 회원의 좋아요 글 번호 목록
		List<String> likeList(String id);

		List<Gogo> getKate(String kate);
}
