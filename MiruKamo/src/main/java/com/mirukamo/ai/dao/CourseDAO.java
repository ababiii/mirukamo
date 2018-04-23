package com.mirukamo.ai.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mirukamo.ai.vo.Mirukamo_course;

@Repository

public class CourseDAO {
	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<Mirukamo_course> selectCourse() {
		//세션만들고 세션에 넣고 커밋 그리고 클로즈
		CourseMapper m = sqlSession.getMapper(CourseMapper.class);
		ArrayList<Mirukamo_course> temp = m.selectCourse();
		return temp;
	}

	public int insertCourse(Mirukamo_course vo) {
			int check = 0;
			CourseMapper mapper = 
					sqlSession.getMapper(CourseMapper.class);
			check = mapper.insertCourse(vo);
			return check;
		}
	}
