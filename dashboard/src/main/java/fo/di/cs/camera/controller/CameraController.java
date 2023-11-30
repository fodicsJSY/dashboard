package fo.di.cs.camera.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fo.di.cs.camera.model.service.CameraService;
import fo.di.cs.main.model.dto.DC_summary;
import fo.di.cs.main.model.dto.DailyCount;
import fo.di.cs.main.model.dto.DailyCount_summary;


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
	public String humanMainCameraForward(
			Model model
			) {
	
		// 휴먼페이지 성별 도넛 차트
		List<DC_summary> genderTotalList = service.genderTotalList();
		model.addAttribute("genderTotalList", genderTotalList);	

		// 휴먼페이지 성별 악세사리 막대&라인 혼합 차트
		List<DailyCount_summary> genderAccList = service.genderAccList();
		model.addAttribute("genderAccList", genderAccList);	
	
		
		//*** 의류 선호도 ***
		
		// 긴 상의 남성 비율
		int longTopWearMan = service.longTopWearMan();
		model.addAttribute("longTopWearMan", longTopWearMan);
		
		// 짧은 상의 남성 비율
		int shortTopWearMan = service.shortTopWearMan();
		model.addAttribute("shortTopWearMan", shortTopWearMan);

		// 긴 하의 남성 비율
		int longBottomWearMan = service.longBottomWearMan();
		model.addAttribute("longBottomWearMan", longBottomWearMan);
		
		// 짧은 하의 남성 비율
		int shortBottomWearMan = service.shortBottomWearMan();
		model.addAttribute("shortBottomWearMan", shortBottomWearMan);
		
		// 긴 상의 여성 비율
		int longTopWearWoman = service.longTopWearWoman();
		model.addAttribute("longTopWearWoman", longTopWearWoman);
		
		// 짧은 상의 여성 비율
		int shortTopWearWoman = service.shortTopWearWoman();
		model.addAttribute("shortTopWearWoman", shortTopWearWoman);
		
		// 긴 하의 여성 비율
		int longBottomWearWoman = service.longBottomWearWoman();
		model.addAttribute("longBottomWearWoman", longBottomWearWoman);
		
		// 짧은 하의 여성 비율
		int shortBottomWearWoman = service.shortBottomWearWoman();
		model.addAttribute("shortBottomWearWoman", shortBottomWearWoman);


//		int[] wearList = {longTopWearMan, shortTopWearMan, longBottomWearMan, shortBottomWearMan, longTopWearWoman, shortTopWearWoman, longBottomWearWoman, shortBottomWearWoman};
//		System.out.println("wearList : "+wearList);
		
		
		
		System.out.println("model : "+model);
		
		 System.out.println("shortBottomWearWoman : "+shortBottomWearWoman);
		
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
