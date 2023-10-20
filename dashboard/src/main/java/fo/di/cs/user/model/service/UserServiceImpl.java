package fo.di.cs.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import fo.di.cs.user.model.dao.UserDAO;
import fo.di.cs.user.model.dto.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO dao;
	
    //@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	//로그인
	@Override
	public int login(User inputUser) {
		
		// 아이디 일치하는 회원 정보 얻어오기
		int result = dao.login(inputUser);
		
		System.out.println("result" +result);
		System.out.println("inputUser" +inputUser);
        
        return result;
    }
		
		

}
