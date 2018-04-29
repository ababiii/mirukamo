
package com.mirukamo.ai.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mirukamo.ai.vo.Mirukamo_course;
import com.mirukamo.ai.vo.MyCourse;

@Repository

public class CourseDAO {
	@Autowired
	SqlSession sqlSession;

	public ArrayList<Mirukamo_course> selectCourse() {
		// 세션만들고 세션에 넣고 커밋 그리고 클로즈
		CourseMapper m = sqlSession.getMapper(CourseMapper.class);
		ArrayList<Mirukamo_course> temp = m.selectCourse();
		return temp;
	}

	public int insertCourse(Mirukamo_course vo) {
		int check = 0;
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		check = mapper.insertCourse(vo);
		return check;
	}

	public ArrayList<Mirukamo_course> senseicours() {
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		// 선생님 강의 가져오기 : 송수근
		System.out.println("선생님 강의 가져오기 : dao");
		ArrayList<Mirukamo_course> course = mapper.getcourse();

		for (int i = 0; i < course.size(); i++) {
			System.out.println(course.get(i));
		}

		return course;
	}

	public ArrayList<Mirukamo_course> picksensei(int num) {
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		ArrayList<Mirukamo_course> picksensei = mapper.picksensei(num);
		
		return picksensei;
	}

	public void insertmypage(MyCourse mycourse) {
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		mapper.mysensei(mycourse);
		return;
	}

	public ArrayList<Mirukamo_course> mirucourse() {
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		ArrayList<Mirukamo_course> mirucourse = mapper.mirucourse();
		return mirucourse;
	}

	public ArrayList<Mirukamo_course> sen(String packagename) {
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		ArrayList<Mirukamo_course> mirucourse = mapper.mirucourse(packagename);
		
		return mirucourse;
	}
	

	
	
}
