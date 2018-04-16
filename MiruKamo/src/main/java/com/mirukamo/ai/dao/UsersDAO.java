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
	
public Users reset_pw(Users u) {
	
	Users users = null;
	
	usersMapper mapper = sqlSession.getMapper(usersMapper.class);
	mapper.reset_pw(u);
	
	return users;
}

public Users find_pw(Users user) {
	usersMapper mapper = sqlSession.getMapper(usersMapper.class);
	Users users = null;
	users = mapper.find_pw(user);
	//System.out.println(users);
	return users;
}

	public Users selectAllUsers(){
		usersMapper mapper = sqlSession.getMapper(usersMapper.class);
		Users users = null;
		users = mapper.selectAllUsers();
		return users;
	}
	
	public Users selectEmail(String userEmail,String userEmail2){
		System.out.println(userEmail+"@"+userEmail2+"dao");
		usersMapper mapper = sqlSession.getMapper(usersMapper.class);
		Users users = null;
		users = mapper.selectEmail(userEmail, userEmail);
		return users;
	}
	
	
}
