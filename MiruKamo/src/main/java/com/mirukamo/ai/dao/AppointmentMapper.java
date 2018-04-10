package com.mirukamo.ai.dao;

import java.util.ArrayList;

import com.mirukamo.ai.vo.Users;

public interface AppointmentMapper {
	
	public ArrayList<Users> findMyID(Users users);

}
