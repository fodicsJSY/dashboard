package fo.di.cs.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fo.di.cs.main.model.dto.DC_summary;
import fo.di.cs.main.model.dto.DailyCount;
import fo.di.cs.main.model.dto.DailyCount_summary;

@Repository
public class MainDAO {

	@Autowired
	private SqlSessionTemplate sql;

	/** 메인페이지 사람차트(금일)
	 * @return list
	 */
	public List<DC_summary> selectMainHumanChart() {
		return sql.selectList("mainPageMapper.selectMainHumanChart");
	}

	/** 메인페이지 사람차트 사람 누적 수 (금일)
	 * @return count
	 */
	public int mainHumanCount() {
		return sql.selectOne("mainPageMapper.mainHumanCount");
	}

	/** 메인페이지 라인차트(금일)
	 * @return list
	 */
	public List<DailyCount> selectMainLineChart() {
		return sql.selectList("mainPageMapper.selectMainLineChart");
	}
	

	/** 마스크 미착용자 성별/연령 비교 (금일)
	 * @return list
	 */
	public List<DailyCount_summary> selectMainMaskChart() {
		return sql.selectList("mainPageMapper.selectMainMaskChart");
	}

	/** 최다검지카메라 사람 테이블(금일)
	 * @return list
	 */
	public List<DailyCount> selectMainHumanTable() {
		return sql.selectList("mainPageMapper.selectMainHumanTable");
	}

	/** 최다검지카메라 차량 테이블(금일)
	 * @return list
	 */
	public List<DailyCount> selectMainVehicleTable() {
		return sql.selectList("mainPageMapper.selectMainVehicleTable");
	}

	/** 메인페이지 사람 막대그래프 & 도넛그래프(날짜 바꾸면~~)
	 * @param occuDate
	 * @return list
	 */
	public List<DC_summary> mainHumanChartChange(String occuDate) {
		return sql.selectList("mainPageMapper.mainHumanChartChange", occuDate);
	}

	
	/** 메인페이지 사람 막대 차트 타이틀 사람 누적 수(날짜 바꾸면~~)
	 * @param occuDate
	 * @return count
	 */
	public int humanCountChange(String occuDate) {
		return sql.selectOne("mainPageMapper.humanCountChange", occuDate);
	}
	
	
	/** 시간대별 라인차트 (날짜 바꾸면~~)
	 * @param occuDate
	 * @return list
	 */
	public List<DailyCount> selectMainLineChartChange(String occuDate) {
		return sql.selectList("mainPageMapper.selectMainLineChartChange", occuDate);
	}

	/** 마스크 미착용자 성별/연령 비교 (날짜 바꾸면~~)
	 * @param occuDate
	 * @return list
	 */
	public List<DailyCount_summary> selectMainMaskChartChange(String occuDate) {
		return sql.selectList("mainPageMapper.selectMainMaskChartChange", occuDate);
	}

	/** 최다검지카메라 사람 테이블(날짜 바꾸면~~)
	 * @param occuDate
	 * @return list
	 */
	public List<DailyCount> selectMainHumanTableChange(String occuDate) {
		return sql.selectList("mainPageMapper.selectMainHumanTableChange", occuDate);
	}

	/** 최다검지카메라 차량 테이블(날짜 바꾸면~~) 
	 * @param occuDate
	 * @return list
	 */
	public List<DailyCount> selectMainVehicleTableChange(String occuDate) {
		return sql.selectList("mainPageMapper.selectMainVehicleTableChange", occuDate);
	}





	
	
}
