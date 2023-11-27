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
	
	
	/** 메인페이지 차량 막대&도넛차트(금일)
	 * @return list
	 */
	List<DC_summary> selectMainVehicleChart();
	
	
	/** 메인페이지 사람 막대차트 타이틀 누적 수(금일)
	 * @return count
	 */
	int mainHumanCount();

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

	/** 최다검지카메라 차량 테이블(금일)
	 * @return list
	 */
	List<DailyCount> selectMainVehicleTable();

	
	/** 메인페이지 사람 막대 차트(날짜 바꾸면~~)
	 * @param occuDate
	 * @return list
	 */
	List<DC_summary> mainHumanChartChange(String occuDate);
	
	/** // 메인페이지 사람 막대 차트 타이틀 사람 누적 수(날짜 바꾸면~~)
	 * @param occuDate
	 * @return count
	 */
	int humanCountChange(String occuDate);

	
	/** 메인페이지 차량 막대 차트(날짜 바꾸면~~)
	 * @param occuDate
	 * @return list
	 */
	List<DC_summary> mainVehicleChartChange(String occuDate);
	
	
	/** 시간대별 라인차트 (날짜 바꾸면~~)
	 * @return list
	 */
	List<DailyCount> selectMainLineChartChange(String occuDate);

	/** 마스크 미착용자 성별/연령 비교 (날짜 바꾸면~~)
	 * @return list
	 */
	List<DailyCount_summary> selectMainMaskChartChange(String occuDate);

	/** 최다검지카메라 사람 테이블(날짜 바꾸면~~)
	 * @return list
	 */
	List<DailyCount> selectMainHumanTableChange(String occuDate);

	/** 최다검지카메라 차량 테이블(날짜 바꾸면~~)
	 * @return list
	 */
	List<DailyCount> selectMainVehicleTableChange(String occuDate);

















	
	
	
	


}