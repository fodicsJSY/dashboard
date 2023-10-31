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
	

	// 설정페이지 이동
	@GetMapping("/setting")
	public String settingForward() {
		return "/main/setting";
	}
	
	
	//sub_object로 이동
	@GetMapping("/sub_object")
	public String main_Forward() {
		return "/main/sub_object";
	}
	
	//sub_object_camera로 이동
	@GetMapping("/sub_object_camera")
	public String main_sub_object_cameraForward() {
		return "/main/sub_object_camera";
	}

	
	//임시페이지
	@GetMapping("/lineStack")
	public String lineStackForward() {
		return "line-stack";
	}
	
	
	
}
