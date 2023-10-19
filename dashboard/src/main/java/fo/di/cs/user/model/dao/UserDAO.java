package fo.di.cs.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fo.di.cs.user.model.dto.User;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	
	


	/** 로그인 DAO
	 * @param inputUser
	 * @return 회원 정보 또는 null
	 */
	public int login(User inputUser) {
		
		return sql.selectOne("userMapper.login", inputUser);
	}







	
	
	
	
}
