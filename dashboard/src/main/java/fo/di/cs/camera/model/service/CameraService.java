package fo.di.cs.camera.model.service;

import java.util.List;

import fo.di.cs.main.model.dto.DC_summary;
import fo.di.cs.main.model.dto.DailyCount;

public interface CameraService {

	/** 메인카메라페이지 금일 누적 합계(공통)
	 * @return list
	 */
	List<DailyCount> selectMainCameraTodayList();

	/** 메인카메라페이지 전일대비(공통)
	 * @return list
	 */
	List<DailyCount> selectNetChangeList();

	/** 마스크를 착용한 남자의 비율 계산(금일)
	 * @return int
	 */
	int maskManCount();

	/** 마스크를 착용한 여자의 비율 계산(금일)
	 * @return int
	 */
	int maskWomanCount();

	
	/** 휴먼페이지 성별 도넛 차트
	 * @return list
	 */
	List<DC_summary> genderTotalList();



}
