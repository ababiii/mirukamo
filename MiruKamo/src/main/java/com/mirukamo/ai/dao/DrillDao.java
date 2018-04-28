package com.mirukamo.ai.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mirukamo.ai.controller.DrillController;
import com.mirukamo.ai.vo.Mirukamo_drill;
import com.mirukamo.ai.vo.mirukamo_question;

@Repository
public class DrillDao {

	@Autowired
	SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(DrillDao.class);
	


	public ArrayList<Mirukamo_drill> getword(String userId) {
		System.out.println("디스팅 시");
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);

		ArrayList<Mirukamo_drill> getword = mapper.getword(userId);

		System.out.println("디스팅 끝");
		return getword;
		
	}

	/*public ArrayList<mirukamo_drill> getRowBoundsword(RowBounds rb) {
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		ArrayList<mirukamo_drill> getRowBoundsword = mapper.getRowBoundsword(rb);	
		
		return getRowBoundsword;
	}*/
	
	//중복없이 가져온 오리지널 넘버가 가진 워드 값 가져오기 -> ovo
	public ArrayList<Mirukamo_drill> word(ArrayList<Mirukamo_drill> getDrill) {
		System.out.println("ovo 시");
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		ArrayList<Mirukamo_drill> ovo = mapper.ovo(getDrill);
		System.out.println("ovo 끝");
		return ovo;
	}

	public ArrayList<Mirukamo_drill> word() {
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		ArrayList<Mirukamo_drill> word = mapper.word();
		return word;
	}


	public void insertDrill(Mirukamo_drill drill) {
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		mapper.insertDrill(drill);
	}

	//마이페이지에서 쓰일 많이 틀린 문장 랭크
	public ArrayList<Mirukamo_drill> getrank() {
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		RowBounds b=new RowBounds(0,3);
		ArrayList<Mirukamo_drill> rank = mapper.rank(b);
		return rank;
	}
};