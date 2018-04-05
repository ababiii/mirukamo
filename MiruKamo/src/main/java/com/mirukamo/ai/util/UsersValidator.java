package com.mirukamo.ai.util;

import java.util.regex.Matcher;


import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mirukamo.ai.dao.UsersDAO;
import com.mirukamo.ai.vo.Users;


public class UsersValidator implements Validator {
	
	
	
	@Autowired
	UsersDAO usersDAO;
	
	public String validate(Users users){
		String s = null;
		Boolean err = false;
		  String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";   
		  Pattern p = Pattern.compile(regex);
		  Matcher m = p.matcher(users.getUserEmail());
		  
		if(users.getUserId().length()==0){
			s="ID를 입럭하세요.";
			return s;
		}
		else if(users.getUserId().length()!=0){
		String id = users.getUserId();
		for(int i=0; i<id.length();i++){
			char ch=id.charAt(i);
			if(!(ch>='0'&&ch<='9'||ch>='A'&&ch<='Z'||ch>='a'&&ch<='z')){
				return "영문,숫자만 입력";
			}
		}
		}
		
		else if(users.getUserId().length()<3){
			return "ID를 3자 이상 입력해 주세요.";
		}else if(users.getUserPassword().length()==0){
			return "비밀번호를 입력해 주세요.";
		//}else if(users.getPassword2().length()==0){
		//	return "비밀번호 확인을 해주세요.";
		}
		else if(users.getUserPassword().length()<5){
			return "비밀번호를 5자이상 입력해 주세요.";
		//}else if(users.getPassword().equals(users.getPassword2())){
		//	return "비밀번호를 동일하게 입력해 주세요.";
		}else if(users.getUserEmail()==null){
			return "이메일을 입력해 주세요.";
		}
		else if(users.getUserEmail().equals(usersDAO.selectUser(users.getUserId()))){
			return "동일한 e-mail이 존재합니다.";
		}else if(m.matches()){
			 
			  return "이메일 형식이 잘못 되었습니다.";
		}
		
	/*	String email ="aaa@aaa.com";
		String emailArray[] = email.split("@");
		String e1= email.substring(0, email.indexOf('@'));*/
	
		return s;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
	}
}
