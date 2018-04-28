package com.mirukamo.ai.dao;

import java.util.ArrayList;

import com.mirukamo.ai.vo.Mirukamo_course;

public interface CourseMapper {

	public ArrayList<Mirukamo_course> selectCourse();

	public int insertCourse(Mirukamo_course vo);

}
