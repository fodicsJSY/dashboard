package fo.di.cs.camera.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fo.di.cs.camera.model.dao.CameraDAO;
import fo.di.cs.main.model.dto.DC_summary;
import fo.di.cs.main.model.dto.DailyCount;
import fo.di.cs.main.model.dto.DailyCount_summary;

@Service
public class CameraServiceImpl implements CameraService{

	
	@Autowired
	private CameraDAO dao;
	
	/**
	 * 메인카메라페이지 금일 누적 합계(공통)
	 */
	@Override
	public List<DailyCount> selectMainCameraTodayList() {
		return dao.selectMainCameraTodayList();
	}
	
	/**
	 * 메인카메라페이지 전일대비(공통)
	 */
	@Override
	public List<DailyCount> selectNetChangeList() {
		return dao.selectNetChangeList();
	}
	
	
	
	/**
	 * 마스크를 착용한 남자의 비율 계산(금일)
	 */
	@Override
	public int maskManCount() {
		return dao.maskManCount();
	}
	
	
	/**
	 * 마스크를 착용한 여자의 비율 계산(금일)
	 */
	@Override
	public int maskWomanCount() {
		return dao.maskWomanCount();
	}
	
	
	/**
	 * 휴먼페이지 성별 도넛 차트
	 */
	@Override
	public List<DC_summary> genderTotalList() {
		return dao.genderTotalList();
	}
	
	
	
	/**
	 * 휴먼페이지 성별 악세사리 막대&라인 혼합 차트
	 */
	@Override
	public List<DailyCount_summary> genderAccList() {
		return dao.genderAccList();
	}
	
	/**
	 * 긴 상의 남성 비율
	 */
	@Override
	public int longTopWearMan() {
		return dao.longTopWearMan();
	}
	
	/**
	 * 짧은 상의 남성 비율
	 */
	@Override
	public int shortTopWearMan() {
		return dao.shortTopWearMan();
	}
	
	/**
	 * 긴 하의 남성 비율
	 */
	@Override
	public int longBottomWearMan() {
		return dao.longBottomWearMan();
	}
	
	/**
	 * 짧은 하의 남성 비율
	 */
	@Override
	public int shortBottomWearMan() {
		return dao.shortBottomWearMan();
	}
	
	/**
	 *긴 상의 여성 비율
	 */
	@Override
	public int longTopWearWoman() {
		return dao.longTopWearWoman();
	}
	
	/**
	 *짧은 상의 여성 비율
	 */
	@Override
	public int shortTopWearWoman() {
		return dao.shortTopWearWoman();
	}
	
	/**
	 *긴 하의 여성 비율
	 */
	@Override
	public int longBottomWearWoman() {
		return dao.longBottomWearWoman();
	}
	
	/**
	 * 짧은 하의 여성 비율
	 */
	@Override
	public int shortBottomWearWoman() {
		return dao.shortBottomWearWoman();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
