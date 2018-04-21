package com.mirukamo.ai.dao;

import java.util.ArrayList;

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
		UsersMapper mapper = sqlSession.getMapper(UsersMapper.class);
		mapper.insertUsers(users);
	}
	
	public Users selectUser(String userId){
		UsersMapper mapper = sqlSession.getMapper(UsersMapper.class);
		Users users = null;
		users = mapper.selectUser(userId);
		
		return users;
	}
	
public Users reset_pw(Users u) {
	
	Users users = null;
	
	UsersMapper mapper = sqlSession.getMapper(UsersMapper.class);
	mapper.reset_pw(u);
	
	return users;
}

public Users find_pw(Users user) {
	UsersMapper mapper = sqlSession.getMapper(UsersMapper.class);
	Users users = null;
	users = mapper.find_pw(user);
	//System.out.println(users);
	return users;
}

	public Users selectAllUsers(){
		UsersMapper mapper = sqlSession.getMapper(UsersMapper.class);
		Users users = null;
		users = mapper.selectAllUsers();
		return users;
	}
	
	public Users selectEmail(Users user){
		UsersMapper mapper = sqlSession.getMapper(UsersMapper.class);
		Users users = null;
		users = mapper.selectEmail(user);
		return users;
	}
	
	
}
