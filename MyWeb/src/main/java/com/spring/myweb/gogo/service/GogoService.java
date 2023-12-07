package com.spring.myweb.gogo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.myweb.gogo.dto.GogoDTO;
import com.spring.myweb.gogo.dto.GogokateDTO;
import com.spring.myweb.gogo.entity.Gogo;
import com.spring.myweb.gogo.mapper.IGogoMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class GogoService {

	private final IGogoMapper mapper;
	
	public List<Gogo> getDetail(String num) {
		List<Gogo> list = mapper.getDetail(num);
		log.info(list.toString());
		
		return mapper.getDetail(num);
	}

	public List<Gogo> getKate(String kate) {
		List<Gogo> list = mapper.getKate(kate);
		log.info(list.toString());
		
		return mapper.getKate(kate);
	}

}
