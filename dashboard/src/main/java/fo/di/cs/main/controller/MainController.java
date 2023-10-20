package fo.di.cs.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import fo.di.cs.main.model.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService service;
	
	
	//초기화면(메인페이지)로 이동
	@GetMapping("/main")
	public String mainForward() {
		return "/main/main";
	}
	

	
	
	
	//sub_object로 이동
	//@GetMapping("/sub_object")
	public String main_Forward() {
		return "/main/sub_object";
	}

	
	//임시페이지
	@GetMapping("/lineStack")
	public String lineStackForward() {
		return "line-stack";
	}
	
	
	
}
