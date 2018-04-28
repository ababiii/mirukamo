package com.mirukamo.ai.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.mirukamo.ai.vo.mirukamo_drill;

public interface DrillMapper {
	
	//오리지날 단어 , 사용자 단어 두개 가지고오기
	public ArrayList<mirukamo_drill> getword(String userId);
	
	//로우 바운드 단어 가져오기
	public ArrayList<mirukamo_drill> getRowBoundsword(RowBounds rb);
	
	//오리지날 워드로 사용자 워드 가져오기
	public ArrayList<mirukamo_drill>ovo (ArrayList<mirukamo_drill> getDrill);
	
	//모든것 다 가져오기
	public ArrayList<mirukamo_drill> word();
	
	//마이페이지 틀린 문장 랭크
	public ArrayList<mirukamo_drill> rank(RowBounds b);

}