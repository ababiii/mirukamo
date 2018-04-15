package com.mirukamo.ai.dao;

import org.apache.ibatis.annotations.Param;

import com.mirukamo.ai.vo.Users;

public interface usersMapper {

	
	public int insertUsers(Users users);
	
	public Users selectUser(String userId);
	
	public Users selectAllUsers();
	
	public Users selectEmail(@Param("a")String userEmail,@Param("b")String userEmail2);
	
}
