package fo.di.cs.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fo.di.cs.main.model.dao.MainDAO;
import fo.di.cs.main.model.dto.DC_summary;
import fo.di.cs.main.model.dto.DailyCount;
import fo.di.cs.main.model.dto.DailyCount_summary;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAO dao;
	
	/**
	 * 메인페이지 사람 막대차트(금일)
	 */
	@Override
	public List<DC_summary> selectMainHumanChart() {
		return dao.selectMainHumanChart();
	}
	
	/**
	 *  메인페이지 차량 막대&도넛차트(금일)
	 */
	@Override
	public List<DC_summary> selectMainVehicleChart() {
		return dao.selectMainVehicleChart();
	}
	
	/**
	 * 메인페이지 사람 막대차트 타이틀 사람 누적 수(금일)
	 */
	@Override
	public int mainHumanCount() {
		return dao.mainHumanCount();
	}
	
	/**
	 *  메인페이지 차량 막대차트 타이틀 누적 수(금일)
	 */
	@Override
	public int mainVehicleCount() {
		return dao.mainVehicleCount();
	}
	
	
	/**
	 * 메인페이지 라인 차트(금일)
	 */
	@Override
	public List<DailyCount> selectMainLineChart() {
		return dao.selectMainLineChart();
	}
	
	
	/**
	 * 마스크 미착용자 성별/연령 비교 (금일)
	 */
	@Override
	public List<DailyCount_summary> selectMainMaskChart() {
		return dao.selectMainMaskChart();
	}
	
	
	/**
	 * 최다검지카메라 사람 테이블(금일)
	 */
	@Override
	public List<DailyCount> selectMainHumanTable() {
		return dao.selectMainHumanTable();
	}
	
	
	/**
	 * 최다검지카메라 차량 테이블(금일)
	 */
	@Override
	public List<DailyCount> selectMainVehicleTable() {
		return dao.selectMainVehicleTable();
	}
	
	
	/**
	 * 이벤트 발생 비율 차트(금일) 
	 */
	@Override
	public List<DailyCount> selectMainEventChart() {
		return dao.selectMainEventChart();
	}
	
	
	
	
	/**
	 * 메인페이지 사람 막대그래프 & 도넛그래프(날짜 바꾸면~~)
	 */
	@Override
	public List<DC_summary> mainHumanChartChange(String occuDate) {
		return dao.mainHumanChartChange(occuDate);
	}
	
	
	/**
	 * 메인페이지 사람 막대 차트 타이틀 사람 누적 수(날짜 바꾸면~~)
	 */
	@Override
	public int humanCountChange(String occuDate) {
		return dao.humanCountChange(occuDate);
	}
	
	/**
	 * 메인페이지 차량 막대그래프 & 도넛그래프(날짜 바꾸면~~)
	 */
	@Override
	public List<DC_summary> mainVehicleChartChange(String occuDate) {
		return dao.mainVehicleChartChange(occuDate);
	}
	
	
	/**
	 * 메인페이지 차량 막대 차트 타이틀 차량 누적 수(날짜 바꾸면~~)
	 */
	@Override
	public int vehicleCountChange(String occuDate) {
		return dao.vehicleCountChange(occuDate);
	}
	
	
	
	/**
	 * 시간대별 라인차트 (날짜 바꾸면~~)
	 */
	@Override
	public List<DailyCount> selectMainLineChartChange(String occuDate) {
		return dao.selectMainLineChartChange(occuDate);
	}
	
	
	
	/**
	 * 마스크 미착용자 성별/연령 비교 (날짜 바꾸면~~)
	 */
	@Override
	public List<DailyCount_summary> selectMainMaskChartChange(String occuDate) {
		return dao.selectMainMaskChartChange(occuDate);
	}
	
	
	/**
	 * 최다검지카메라 사람 테이블(날짜 바꾸면~~)
	 */
	@Override
		public List<DailyCount> selectMainHumanTableChange(String occuDate) {
			return dao.selectMainHumanTableChange(occuDate);
		}
	
	
	/**
	 * 최다검지카메라 차량 테이블(날짜 바꾸면~~)
	 */
	@Override
	public List<DailyCount> selectMainVehicleTableChange(String occuDate) {
		return dao.selectMainVehicleTableChange(occuDate);
	}

	
	
	
	
}
