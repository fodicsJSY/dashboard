package fo.di.cs.main.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fo.di.cs.main.model.dto.DC_summary;
import fo.di.cs.main.model.dto.DailyCount;
import fo.di.cs.main.model.dto.DailyCount_summary;
import fo.di.cs.main.model.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService service;
	
	
	//초기화면(메인페이지)로 이동
	 @GetMapping("/main")
	 //@ResponseBody
	public String mainForward(
			Model model
			) {
		
		// 메인페이지 사람 막대 차트(금일)
		List<DC_summary> DC_summaryList = service.selectMainHumanChart();
		model.addAttribute("DC_summaryList", DC_summaryList);
		
		// 메인페이지 시간대별라인차트(금일)
		List<DailyCount> dailyCount = service.selectMainLineChart();
		model.addAttribute("dailyCount", dailyCount);
		
		// 마스크 미착용자 성별/연령 비교 (금일)
		List<DailyCount_summary> DailyCount_summary = service.selectMainMaskChart();
		model.addAttribute("DailyCount_summary", DailyCount_summary);
		
		// 최다검지카메라 사람 테이블(금일)
		List<DailyCount> dailyCount_CNT = service.selectMainHumanTable();
		model.addAttribute("dailyCount_CNT", dailyCount_CNT);
		
		
		// 최다검지카메라 차량 테이블(금일)
		List<DailyCount> vehicleDailyCount_CNT = service.selectMainVehicleTable();
		model.addAttribute("vehicleDailyCount_CNT", vehicleDailyCount_CNT);
		
		// list들어왔는지 확인
		System.out.println("DC_summaryList : "+ DC_summaryList);
		System.out.println("dailyCount : "+ dailyCount);
		System.out.println("DailyCount_summary : "+ DailyCount_summary);
		System.out.println("dailyCount_CNT : "+ dailyCount_CNT);
		System.out.println("vehicleDailyCount_CNT : "+ vehicleDailyCount_CNT);
		
		return "main/main";
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
	
	
	//임시페이지
	@GetMapping("/popSetting")
	public String popSettingForward() {
		return "common/popSetting";
	}
	
	
	
}
