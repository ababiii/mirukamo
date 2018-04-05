package mirukamoDao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mirukamoMapper.ServiceCenterMapper;
import mirukamoVo.mirukamo_question;


public class ServiceCenterDao {

	@Autowired
	SqlSession sqlSession;
	
	//공지 사항
	public ArrayList<mirukamo_question> boardinfo(){
		
		ServiceCenterMapper mapper = sqlSession.getMapper(ServiceCenterMapper.class);
		
		System.out.println("공지사항 출력 다오 접속");
		
		ArrayList<mirukamo_question> boardinfo = mapper.getboardinfo();
		
		System.out.println("잘 가져온건가 확인하는"+boardinfo.toString());
		
		return boardinfo;
	}
	
	
}
