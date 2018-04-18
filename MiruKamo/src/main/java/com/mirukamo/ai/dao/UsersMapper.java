package com.mirukamo.ai.dao;


import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.mirukamo.ai.vo.Users;

public interface UsersMapper {

	
	public int insertUsers(Users users);
	
	public Users selectUser(String userId);

	public int reset_pw(Users users);

	public Users find_pw(Users user);


	
	public Users selectAllUsers();
	
	public Users selectEmail(Users user);
	
	
	
}
