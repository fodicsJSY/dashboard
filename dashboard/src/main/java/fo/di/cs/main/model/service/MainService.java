package fo.di.cs.main.model.service;


import java.util.List;

import fo.di.cs.main.model.dto.DC_summary;
import fo.di.cs.main.model.dto.DailyCount;
import fo.di.cs.main.model.dto.DailyCount_summary;



public interface MainService {

	/** 메인페이지 사람 막대차트(금일)
	 * @return list
	 */
	List<DC_summary> selectMainHumanChart();

	/** 메인페이지 라인차트(금일)
	 * @return list
	 */
	List<DailyCount> selectMainLineChart();

	/** 마스크 미착용자 성별/연령 비교 (금일)
	 * @return list
	 */
	List<DailyCount_summary> selectMainMaskChart();

	/** 최다검지카메라 사람 테이블(금일)
	 * @return list
	 */
	List<DailyCount> selectMainHumanTable();








	
	
	
	


}