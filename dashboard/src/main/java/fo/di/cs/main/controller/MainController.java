package fo.di.cs.main.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

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
	 public String mainForward1(
			 Model model
			 ) {
		 
		 // 메인페이지 사람 막대 차트(금일)
		 List<DC_summary> DC_summaryList = service.selectMainHumanChart();
		 model.addAttribute("DC_summaryList", DC_summaryList);

		 // 메인페이지 사람 막대 차트(금일)
		 List<DC_summary> DC_summaryVehicleList = service.selectMainVehicleChart();
		 model.addAttribute("DC_summaryVehicleList", DC_summaryVehicleList);
		 
		 
		 // 메인페이지 사람 막대 차트 타이틀 사람 누적 수(금일)
		 int humanCount = service.mainHumanCount();
		 model.addAttribute("humanCount", humanCount);
		 
		 // 메인페이지 사람 막대 차트 타이틀 사람 누적 수(금일)
		 int vehicleCount = service.mainVehicleCount();
		 model.addAttribute("vehicleCount", vehicleCount);
		 
		 
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

		 // 이벤트 발생 비율 차트(금일) 
		 List<DailyCount> selectMainEventList = service.selectMainEventChart();
		 model.addAttribute("selectMainEventList", selectMainEventList);
		 
		 // list들어왔는지 확인
//		System.out.println("DC_summaryList : "+ DC_summaryList);
//		System.out.println("dailyCount : "+ dailyCount);
//		System.out.println("DailyCount_summary : "+ DailyCount_summary);
//		System.out.println("dailyCount_CNT : "+ dailyCount_CNT);
//		System.out.println("vehicleDailyCount_CNT : "+ vehicleDailyCount_CNT);
//		System.out.println("humanCount : "+ humanCount);
		 
		 return "main/main";
	 }
	 
	 
	 
	 // 날짜 변경 시 차트데이터 변경하기
	 @GetMapping("/dateChange")
	 @ResponseBody
	 public Map<String, Object> changeChart(
			 @RequestParam(value="occuDate") String occuDate
			 ) {
		 Map<String, Object> map = new HashMap<>();
		 
		 
		
		// 메인페이지 사람 막대 차트(날짜 바꾸면~~)
		List<DC_summary> DC_summaryChangeList = service.mainHumanChartChange(occuDate);
		map.put("DC_summaryChangeList", DC_summaryChangeList);
		
		// 메인페이지 사람 막대 차트 타이틀 사람 누적 수(날짜 바꾸면~~)
		int humanCountChange = service.humanCountChange(occuDate);
		map.put("humanCountChange", humanCountChange);
		
		// 메인페이지 차량 막대 차트(날짜 바꾸면~~)
		List<DC_summary> DC_summaryVehicleChangeList = service.mainVehicleChartChange(occuDate);
		map.put("DC_summaryVehicleChangeList", DC_summaryVehicleChangeList);
		
		// 메인페이지 차량 막대 차트 타이틀 차량 누적 수(날짜 바꾸면~~)
		int vehicleCountChange = service.vehicleCountChange(occuDate);
		map.put("vehicleCountChange", vehicleCountChange);
		
	
		// 메인페이지 시간대별라인차트(날짜 바꾸면~~)
		List<DailyCount> dailyCountChangeList = service.selectMainLineChartChange(occuDate);
		map.put("dailyCountChangeList", dailyCountChangeList);
		
		// 마스크 미착용자 성별/연령 비교 (날짜 바꾸면~~)
		List<DailyCount_summary> DailyCount_summaryChangeList = service.selectMainMaskChartChange(occuDate);
		map.put("DailyCount_summaryChangeList", DailyCount_summaryChangeList);
		
		// 최다검지카메라 사람 테이블(날짜 바꾸면~~)
		List<DailyCount> dailyCount_CNT_changeList = service.selectMainHumanTableChange(occuDate);
		map.put("dailyCount_CNT_changeList", dailyCount_CNT_changeList);
		
		// 최다검지카메라 차량 테이블(날짜 바꾸면~~)
		List<DailyCount> vehicleDailyCount_CNT_changeList = service.selectMainVehicleTableChange(occuDate);
		map.put("vehicleDailyCount_CNT_changeList", vehicleDailyCount_CNT_changeList);

		
		// 이벤트 발생 비율 차트(날짜 바꾸면~~)
		List<DailyCount> mainEventChart_changeList = service.mainEventChart_changeList(occuDate);
		map.put("mainEventChart_changeList", mainEventChart_changeList);
		 
		
	
		// list들어왔는지 확인
//		System.out.println("occuDate : "+ occuDate);
//		System.out.println("DC_summaryChangeList : "+ DC_summaryChangeList);
//		System.out.println("dailyCountChangeList : "+ dailyCountChangeList);
//		System.out.println("DailyCount_summaryChangeList : "+ DailyCount_summaryChangeList);
//		System.out.println("dailyCount_CNT_changeList : "+ dailyCount_CNT_changeList);
//		System.out.println("vehicleDailyCount_CNT_changeList : "+ vehicleDailyCount_CNT_changeList);
//		System.out.println("map"+map);
//		System.out.println("humanCountChange : "+humanCountChange);
		
		
	    return map;
	 }
	 
	 
	// 사람버튼 클릭 시 데이터 변경(금일)
	 @GetMapping("/humanTable")
	 @ResponseBody
	 public Map<String, Object> humanTable(
			 ){
		 Map<String, Object> map = new HashMap<>();
		 

		// 최다검지카메라 사람 테이블(금일)
		List<DailyCount> dailyCount_CNT = service.selectMainHumanTable();
		map.put("dailyCount_CNT", dailyCount_CNT);
		 
		 //System.out.println("map2 : "+map);
		 
		 return map;
	 }
	 
	 
	 
	 // 차량버튼 클릭 시 데이터 변경(금일)
	 @GetMapping("/vehicleTable")
	 @ResponseBody
	 public Map<String, Object> vehicleTable(
			 ){
		 Map<String, Object> map = new HashMap<>();
		 
		// 최다검지카메라 차량 테이블(날짜 바꾸면~~)
		List<DailyCount> vehicleDailyCount_CNT = service.selectMainVehicleTable();
		map.put("vehicleDailyCount_CNT", vehicleDailyCount_CNT);
		 
		//System.out.println("map2 : "+map);
		 
		 return map;
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
