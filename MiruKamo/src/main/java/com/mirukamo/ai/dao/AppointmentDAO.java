package com.mirukamo.ai.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mirukamo.ai.vo.MyCourse;
import com.mirukamo.ai.vo.Users;

@Repository
public class AppointmentDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<Users> findMyID(Users users){
		AppointmentMapper mapper=sqlSession.getMapper(AppointmentMapper.class);
		ArrayList<Users> list=mapper.findMyID(users);
		return list;
	}
	
	public ArrayList<MyCourse> getMyCourse(String member_id){
		AppointmentMapper mapper=sqlSession.getMapper(AppointmentMapper.class);
		ArrayList<MyCourse> list=mapper.getMyCourse(member_id);
		return list;
	}

	public Users getMyInfo(String id){
		AppointmentMapper mapper=sqlSession.getMapper(AppointmentMapper.class);
		Users result=mapper.getMyInfo(id);
		return result;
	}
	
	public void setMyInfo(Users user){
		AppointmentMapper mapper=sqlSession.getMapper(AppointmentMapper.class);
		mapper.setMyInfo(user);
	}
}
