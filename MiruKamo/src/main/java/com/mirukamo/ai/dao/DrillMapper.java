package com.mirukamo.ai.dao;

import java.util.ArrayList;

import com.mirukamo.ai.vo.mirukamo_drill;

public interface DrillMapper {
	
	//오리지날 단어 , 사용자 단어 두개 가지고오기
	public ArrayList<mirukamo_drill> getword();


}