package fo.di.cs.camera.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fo.di.cs.camera.model.dao.CameraDAO;
import fo.di.cs.main.model.dto.DC_summary;
import fo.di.cs.main.model.dto.DailyCount;

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
	
}
