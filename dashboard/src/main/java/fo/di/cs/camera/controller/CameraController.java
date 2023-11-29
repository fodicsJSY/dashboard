package fo.di.cs.camera.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fo.di.cs.camera.model.service.CameraService;
import fo.di.cs.main.model.dto.DailyCount;


@Controller
public class CameraController {
	
	@Autowired
	private CameraService service;
	
	//메인카메라페이지로 이동
	@GetMapping("/mainCamera")
	public String mainCameraForward(
			Model model
			) {
		
		//메인카메라페이지 금일 누적 합계(공통)
		 List<DailyCount> todayList = service.selectMainCameraTodayList();
		 model.addAttribute("todayList", todayList);

		 //메인카메라페이지 전일대비(공통)
		 List<DailyCount> netChangeList = service.selectNetChangeList();
		 model.addAttribute("netChangeList", netChangeList);
		 
		 //마스크를 착용한 남자의 비율 계산(금일)
		 int maskManCount= service.maskManCount();
		 model.addAttribute("maskManCount", maskManCount);

		 //마스크를 착용한 여자의 비율 계산(금일)
		 int maskWomanCount= service.maskWomanCount();
		 model.addAttribute("maskWomanCount", maskWomanCount);
		 
//		 System.out.println("todayList : "+todayList);
//		 System.out.println("netChangeList : "+netChangeList);
//		 System.out.println("maskManCount : "+maskManCount);
//		 System.out.println("maskWomanCount : "+maskWomanCount);
		 
		 
		
		return "camera/mainCamera";
	}


	
	//서브카메라페이지로 이동
	@GetMapping("/mainCamera/subCamera")
	public String subCameraForward() {
		return "camera/subCamera";
	}

	//서브카메라2페이지로 이동
	@GetMapping("/mainCamera/subCamera2")
	public String subCamera2Forward() {
		return "camera/subCamera2";
	}
	
	
	//사람 메인카메라페이지로 이동
	@GetMapping("/mainCamera/mainCameraPart1Human")
	public String humanMainCameraForward() {
		return "camera/main_camera_part1_human";
	}
	
	
	
	//차량 메인 카메라페이지로 이동
	@GetMapping("/mainCamera/mainCameraPart1Vehicle")
	public String vehicleMainCameraForward() {
		return "camera/main_camera_part1_Vehicle";
	}

	
	//얼굴 메인 카메라페이지로 이동
	@GetMapping("/mainCamera/mainCameraPart1Face")
	public String faceMainCameraForward() {
		return "camera/main_camera_part1_face";
	}
	
	//카운팅 메인 카메라페이지로 이동
	@GetMapping("/mainCamera/mainCameraPart1Counting")
	public String countingMainCameraForward() {
		return "camera/main_camera_part1_counting";
	}
	
	//침입 메인 카메라페이지로 이동
	@GetMapping("/mainCamera/mainCameraPart1Invasion")
	public String invasionMainCameraForward() {
		return "camera/main_camera_part1_Invasion";
	}
	
	//배회 메인 카메라페이지로 이동
	@GetMapping("/mainCamera/mainCameraPart1Loitering")
	public String loiteringMainCameraForward() {
		return "camera/main_camera_part1_loitering";
	}
	


}
