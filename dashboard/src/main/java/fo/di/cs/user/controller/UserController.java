package fo.di.cs.user.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import fo.di.cs.user.model.dto.User;
import fo.di.cs.user.model.service.UserService;

@SessionAttributes({"loginUser"}) 
@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	
	//로그인페이지로 이동
	@GetMapping("/")
	public String loginForward() {
		return "login";
	}
	
	
	
	
	// 로그인 페이지에서 로그인 요청
	@PostMapping("/login")
	public String login(User inputUser
						, Model model
						, @RequestHeader(value="referer") String referer
						// -> 요청 HTTP header에서 "referer"(이전주소) 값을 얻어와 매개 변수 String referer에 저장
						, HttpServletResponse resp
						// HttpServletResponse resp : 서버 -> 클라이언트 응답 방법을 가지고 있는 객체
						, RedirectAttributes ra
						// 메시지를 리다이렉트에 담아서 보내버림
						) {
		
		
		// 로그인 서비스 호출
		int loginUser = service.login(inputUser);
		
		String path = "redirect:";
        
		if(loginUser == 1) { // 로그인 성공시
			
			// 메인페이지로 이동
			path += "main";
			// model 전달객체에 세팅 -> 클래스 위에 @SessionAttributes으로 세션으로 추가됨
			model.addAttribute("loginUser",loginUser);
						
		}else {
			
			// 이전페이지로 돌아감
			path += referer;
			ra.addFlashAttribute("serverMessage","아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return path;
	}
	
	
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {
		
		status.setComplete();
		session.invalidate();

		return "redirect:/";
	}
	
	
	

}
