package fo.di.cs.user.model.service;

import fo.di.cs.user.model.dto.User;



public interface UserService {
	// 로그인
	int login(User inputUser);
}
