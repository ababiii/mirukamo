package com.mirukamo.ai.dao;

import java.util.ArrayList;

import com.mirukamo.ai.vo.MyCourse;
import com.mirukamo.ai.vo.Users;

public interface AppointmentMapper {
	
	public ArrayList<Users> findMyID(Users users);

	public ArrayList<MyCourse> getMyCourse(String member_id);
	public Users getMyInfo(String id);
	public void setMyInfo(Users user);




}
