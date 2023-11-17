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

	
	
}
