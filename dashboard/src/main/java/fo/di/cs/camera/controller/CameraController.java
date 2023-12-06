package fo.di.cs.camera.controller;

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
		 
		 
		 // 사람
		 List<DailyCount> dailyPersonCount = service.dailyPersonCount();
		 model.addAttribute("dailyPersonCount", dailyPersonCount);
//		 System.out.println("dailyPersonCount : "+dailyPersonCount);
		 
		 // 차량
		 List<DailyCount> dailyVehicleCount = service.dailyVehicleCount();
		 model.addAttribute("dailyVehicleCount", dailyVehicleCount);
//		 System.out.println("dailyVehicleCount : "+dailyVehicleCount);
		 
		 // 얼굴
		 List<DailyCount> dailyFaceCount = service.dailyFaceCount();
		 model.addAttribute("dailyFaceCount", dailyFaceCount);
//		 System.out.println("dailyFaceCount : "+dailyFaceCount);
		 
		 // 차량 번호판
		 List<DailyCount> dailyLprCount = service.dailyLprCount();
		 model.addAttribute("dailyLprCount", dailyLprCount);
//		 System.out.println("dailyLprCount : "+dailyLprCount);
		 
		 // 침입
		 List<DailyCount> dailyInvCntCount = service.dailyInvCntCount();
		 model.addAttribute("dailyInvCntCount", dailyInvCntCount);
//		 System.out.println("dailyInvCntCount : "+dailyInvCntCount);
		 
		 // 배회
		 List<DailyCount> dailyLotCntCount = service.dailyLotCntCount();
		 model.addAttribute("dailyLotCntCount", dailyLotCntCount);
//		 System.out.println("dailyLotCntCount : "+dailyLotCntCount);
		 
		 // 카운팅
		 List<DailyCount> dailyCntCntCount = service.dailyCntCntCount();
		 model.addAttribute("dailyCntCntCount", dailyCntCntCount);
//		 System.out.println("dailyCntCntCount : "+dailyCntCntCount);
		 

		 
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

		
		// 무채색 상의 남성
		double monoTopWearMan = service.monoTopWearMan();
		
		// 난색 상의 남성
		double polyTopWearMan = service.polyTopWearMan();
		
		// 한색 상의 남성
		double huesTopWearMan = service.huesTopWearMan();
		
		//무채색 하의 남성
		double monoBottomWearMan = service.monoBottomWearMan();
		
		// 난색 하의 남성
		double polyBottomWearMan = service.polyBottomWearMan();
		
		// 한색 하의 남성
		double huesBottomWearMan = service.huesBottomWearMan();
		
		// 무채색 상의 여성
		double monoTopWearWoman = service.monoTopWearWoman();
		
		
		// 난색 상의 여성
		double polyTopWearWoman = service.polyTopWearWoman();
		
		// 한색 상의 여성
		double huesTopWearWoman = service.huesTopWearWoman();
		
		// 무채색 하의 여성
		double monoBottomWearWoman = service.monoBottomWearWoman();
		
		// 난색 하의 여성
		double polyBottomWearWoman = service.polyBottomWearWoman();
		
		// 한색 하의 여성
		double huesBottomWearWoman = service.huesBottomWearWoman();
		

		double[] wearColorList = {monoTopWearMan, polyTopWearMan, huesTopWearMan
		, monoBottomWearMan, polyBottomWearMan, huesBottomWearMan, monoTopWearWoman, 
		polyTopWearWoman, huesTopWearWoman, monoBottomWearWoman, polyBottomWearWoman, huesBottomWearWoman};
		model.addAttribute("wearColorList", wearColorList);

//		System.out.println("wearColorList : "+wearColorList);
		
		return "camera/main_camera_part1_human";
	}
	
	
	
	//차량 메인 카메라페이지로 이동
	@GetMapping("/mainCamera/mainCameraPart1Vehicle")
	public String vehicleMainCameraForward(
			Model model
			) {
		
		// 자동차비율
		double carPercentage = service.carPercentage();
		model.addAttribute("carPercentage",carPercentage);
		
		// 버스비율
		double busPercentage = service.busPercentage();
		model.addAttribute("busPercentage",busPercentage);
		
		// 트럭비율
		double truckPercentage = service.truckPercentage();
		model.addAttribute("truckPercentage",truckPercentage);
		
		// 오토바이비율
		double motorcyclePercentage = service.motorcyclePercentage();
		model.addAttribute("motorcyclePercentage",motorcyclePercentage);
		
		// 자전거비율
		double cyclePercentage = service.cyclePercentage();
		model.addAttribute("cyclePercentage",cyclePercentage);
		
		
		return "camera/main_camera_part1_Vehicle";
	}

	
	//얼굴 메인 카메라페이지로 이동
	@GetMapping("/mainCamera/mainCameraPart1Face")
	public String faceMainCameraForward(
			Model model
			) {
		
		// 얼굴페이지 남녀 얼궇 수 도넛 차트
		List<DailyCount_summary> FacePageCountList = service.facePageCount();
		model.addAttribute("FacePageCountList", FacePageCountList);	

		// 얼굴페이지 악세사리 막대&라인 혼합차트
		List<DailyCount_summary> dailyFaceAccList = service.dailyFaceAcc();
		model.addAttribute("dailyFaceAccList", dailyFaceAccList);	
		
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
