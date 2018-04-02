package dao;

import com.project_practice.www.VO.Users;

public interface usersMapper {

	
	public int insertUsers(Users users);
	
	public Users selectUser(String userId);
}
