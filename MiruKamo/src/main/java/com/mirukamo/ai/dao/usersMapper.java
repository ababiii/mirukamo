package com.mirukamo.ai.dao;

import com.mirukamo.ai.vo.Users;

public interface usersMapper {

	
	public int insertUsers(Users users);
	
	public Users selectUser(String userId);
	
	public Users selectAllUsers();
}
