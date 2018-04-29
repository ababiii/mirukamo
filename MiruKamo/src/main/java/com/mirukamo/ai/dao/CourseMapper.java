
package com.mirukamo.ai.dao;

import java.util.ArrayList;

import com.mirukamo.ai.vo.Mirukamo_course;
import com.mirukamo.ai.vo.MyCourse;

public interface CourseMapper {

	public ArrayList<Mirukamo_course> selectCourse();
	
	//강의 업로드 저장
	public int insertCourse(Mirukamo_course vo);
	
	//강의 가져오기 송수근
	public ArrayList<Mirukamo_course> getcourse();

	//선택한 선생 강의정보
	public ArrayList<Mirukamo_course> picksensei(int num);

	public ArrayList<Mirukamo_course> sensei(String teacher);
	
	//수강신청 버튼 누루면 수강 마이코스 정보 저장
	public void mysensei(MyCourse mycourse);
	
	//수강 목록 가져와서 수강신청 페이지에 보여주기
	public ArrayList<Mirukamo_course> mirucourse();
	
	//중복없이 가져온 패키티타이틀로 선생님, 랭귀지 , num가져오기
	public ArrayList<Mirukamo_course> mirucourse(String packagename);

	
	//수강페이지 수강신청에 쓰일것 
	public Mirukamo_course yoursenseicours(int num);

	
	public ArrayList<MyCourse> myc(String member_id);
	
	//마이페이지 강의 저장
	public void ADDClass(Mirukamo_course course);
	//public void ADDClass(ArrayList<Mirukamo_course> course);

	
	

	
}