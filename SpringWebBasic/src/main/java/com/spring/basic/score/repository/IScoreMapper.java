package com.spring.basic.score.repository;

import java.util.List;

import com.spring.basic.score.entity.Score;

//역할 명세(추상화)
// 성적 정보를 잘 저장하고 잘 조회하고 잘 삭제하고 잘 수정해야함
// Score에 관련된 여러가지 동작들을 명세하여 구현하는 클래스들이
// 동일한 동작을 약속하게 하자.
public interface IScoreMapper {
	
	//성적 정보 전체 조회 (score가 성적인데 학생 전부를 봐야하니 List로)
	List<Score> findAll();
	
	//성적 정보 등록
	void save(Score score);

	//성적 정보 개별 조회 메서드
	Score findByStuNum(int stuNum);
	
	//성적 정보 삭제
	void deleteByStuNum(int stuNum);

	//성적 정보 수정
	void modify(Score modScore);
	
	
}