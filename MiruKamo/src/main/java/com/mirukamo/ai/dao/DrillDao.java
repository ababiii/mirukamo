package com.mirukamo.ai.dao;

import java.util.ArrayList;

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

		System.out.println("드릴 다오 출발");
	
		DrillMapper mapper = sqlSession.getMapper(DrillMapper.class);
		ArrayList<mirukamo_drill> getword = mapper.getword();
		
		System.out.println("드릴 다오 끝");
		return getword;

	}
};
