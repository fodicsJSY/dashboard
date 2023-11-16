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
}
