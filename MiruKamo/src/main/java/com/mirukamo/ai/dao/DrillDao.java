package com.mirukamo.ai.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mirukamo.ai.controller.DrillController;
import com.mirukamo.ai.vo.mirukamo_drill;
import com.mirukamo.ai.vo.mirukamo_question;

@Repository
public class DrillDao {

	@Autowired
	SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(DrillDao.class);
	

	public ArrayList<mirukamo_drill> getword() {
		System.out.println("디스팅 시");
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		ArrayList<mirukamo_drill> getword = mapper.getword();
		System.out.println("디스팅 끝");
		return getword;
		
	}

	/*public ArrayList<mirukamo_drill> getRowBoundsword(RowBounds rb) {
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		ArrayList<mirukamo_drill> getRowBoundsword = mapper.getRowBoundsword(rb);	
		
		return getRowBoundsword;
	}*/
	
	//중복없이 가져온 오리지널 넘버가 가진 워드 값 가져오기 -> ovo
	public ArrayList<mirukamo_drill> word(ArrayList<mirukamo_drill> getDrill) {
		System.out.println("ovo 시");
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		ArrayList<mirukamo_drill> ovo = mapper.ovo(getDrill);
		System.out.println("ovo 끝");
		return ovo;
	}

	public ArrayList<mirukamo_drill> word() {
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		ArrayList<mirukamo_drill> word = mapper.word();
		return word;
	}
};