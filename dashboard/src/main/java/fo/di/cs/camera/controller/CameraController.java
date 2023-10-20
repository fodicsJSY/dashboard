package fo.di.cs.camera.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import fo.di.cs.camera.model.service.CameraService;


@Controller
public class CameraController {
	
	@Autowired
	private CameraService service;
	
	//메인카메라페이지로 이동
	@GetMapping("/mainCamera")
	public String mainCameraForward() {
		return "camera/mainCamera";
	}
	
	//서브카메라페이지로 이동
	//@GetMapping("/mainCamera/subCamera")
	public String subCameraForward() {
		return "camera/subCamera";
	}
	
	
	//사람 메인카메라페이지로 이동
	//@GetMapping("/mainCamera/mainCameraPart1Human")
	public String humanMainCameraForward() {
		return "camera/main_camera_part1_human";
	}
	
	
	
	//차량 메인 카메라페이지로 이동
	//@GetMapping("/mainCamera/mainCameraPart1Vehicle")
	public String vehicleMainCameraForward() {
		return "camera/main_camera_part1_Vehicle";
	}

	
	//엘굴 메인 카메라페이지로 이동
	//@GetMapping("/mainCamera/mainCameraPart1Face")
	public String faceMainCameraForward() {
		return "camera/main_camera_part1_face";
	}
	
	//카운팅 메인 카메라페이지로 이동
	//@GetMapping("/mainCamera/mainCameraPart1Counting")
	public String countingMainCameraForward() {
		return "camera/main_camera_part1_counting";
	}
	
	//침입 메인 카메라페이지로 이동
	//@GetMapping("/mainCamera/mainCameraPart1Invasion")
	public String invasionMainCameraForward() {
		return "camera/main_camera_part1_invation";
	}
	
	//배회 메인 카메라페이지로 이동
	//@GetMapping("/mainCamera/mainCameraPart1Loitering")
	public String loiteringMainCameraForward() {
		return "camera/main_camera_part1_loitering";
	}
	


}
