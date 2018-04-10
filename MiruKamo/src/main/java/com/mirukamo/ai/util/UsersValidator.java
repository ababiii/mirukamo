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
		  Matcher m = p.matcher(users.getEmail());
		  String regExp1 = "/^[a-zA-Z0-9]{4,12}$/";
          //id와 비밀번호의 유효성 검사
          //String regExp2 = "/[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i";
          //e-mail의 유효성 검사
          String regname = "/^[가-힝]{2,}$/";
          //이름의 유효성 검사

		  
		if(users.getId().length()==0){
			s="ID를 입럭하세요.";
			return s;
		}
		if(regExp1.contains(users.getId())){
			s="영문과 숫자만 입력하세요.";
			return s;
		}
		
		else if(users.getId().length()<3){
			s="ID를 3자 이상 입력해 주세요.";
			return s;
		}else if(users.getPassword().length()==0){
			s="비밀번호를 입력해 주세요.";
			return s;
		//}else if(users.getPassword2().length()==0){
		//	return "비밀번호 확인을 해주세요.";
		}
		else if(users.getPassword().length()<5){
			return "비밀번호를 5자이상 입력해 주세요.";
		}else if(users.getEmail()==null){
			s="이메일을 입력해 주세요.";
			return s;
		}else if(users.getEmail2().length()==0){
			s="이메일 도메인을 입력해 주세요.";
			return s;
		}
		else if(m.matches()){
			 s="이메일 형식이 잘못 되었습니다.";
			  return s;
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
