package com.spring.basic.score.repository;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.spring.basic.score.entity.Score;

import lombok.RequiredArgsConstructor;

@Repository("spring")
@RequiredArgsConstructor
public class ScoreSpringRepository implements IScoreRepository {
	// scoremapper.java의 내용을 여기서 쓰고 파일을 삭제해도됨 ( 내부 클래스 )
	// 대신 여기서만 사용 가능함
	
	private final JdbcTemplate template;

	@Override
	public List<Score> findAll() {
		String sql = "SELECT * FROM score";
		return template.query(sql,new ScoreMapper());
	}

	@Override
	public void save(Score score) {
		String sql = "INSERT INTO score " 
				+ "VALUES(score_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		template.update(sql,score.getStuName(),score.getKor(),score.getEng(),score.getMath(),score.getTotal(),score.getAverage(),
				String.valueOf(score.getGrade()));
		//수정 , 삭제 둘다 .update임

	}

	@Override
	public Score findByStuNum(int stuNum) {
		String sql = "SELECT * FROM score WHERE stu_num = ?";
		try {
			// queryForobject는 조회 결과가 없을 시 예외가 발생합니다.
			return template.queryForObject(sql, new ScoreMapper() , stuNum); // 객체를 하나만 가져올떄 (상세보기 기능이니까)
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void deleteByStuNum(int stuNum) {
		String sql = "DELETE FROM score WHERE stu_num = ?";
		template.update(sql,stuNum);
	}

	@Override
	public void modify(Score modScore) {
		String sql = "UPDATE score " + "SET kor=?,eng=?,math=?,total=?,average=?,grade=? "
				 + "WHERE stu_Num = ?";
		template.update(sql,modScore.getKor(),modScore.getEng(),modScore.getMath(),modScore.getTotal(),modScore.getAverage(),
				String.valueOf(modScore.getGrade()),modScore.getStuNum());
	}

}
