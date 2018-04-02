package dao;


import org.springframework.beans.factory.annotation.Autowired;

import vo.Users;


@Repository
public class UsersDAO {

	@Autowired
	SqlSession sqlSession;
	
	public void insertUser(Users users){
		usersMapper mapper = sqlSession.getMapper(usersMapper.class);
		mapper.insertUsers(users);
	}
	
	public Users selectUser(String userId){
		usersMapper mapper = sqlSession.getMapper(usersMapper.class);
		Users users = null;
		users = mapper.selectUser(userId);
		System.out.println(users);
		return users;
	}
	
	
}
