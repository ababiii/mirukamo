package com.mirukamo.ai.dao;

import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mirukamo.ai.vo.Users;


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
	
	public Users selectAllUsers(){
		usersMapper mapper = sqlSession.getMapper(usersMapper.class);
		Users users = null;
		users = mapper.selectAllUsers();
		return users;
	}
	
	public Users selectEmail(String userEmail){
		usersMapper mapper = sqlSession.getMapper(usersMapper.class);
		Users users = null;
		users = mapper.selectEmail(userEmail);
		return users;
	}
	
	
}
