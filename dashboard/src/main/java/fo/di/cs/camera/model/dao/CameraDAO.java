package fo.di.cs.camera.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fo.di.cs.main.model.dto.DC_summary;
import fo.di.cs.main.model.dto.DailyCount;
import fo.di.cs.main.model.dto.DailyCount_summary;

@Repository
public class CameraDAO {

	@Autowired
	private SqlSessionTemplate sql;

	/** 메인카메라페이지 금일 누적 합계(공통)
	 * @return list
	 */
	public List<DailyCount> selectMainCameraTodayList() {
		return sql.selectList("cameraPageMapper.selectMainCameraTodayList");
	}

	/** 메인카메라페이지 전일대비(공통)
	 * @return list
	 */
	public List<DailyCount> selectNetChangeList() {
		return sql.selectList("cameraPageMapper.selectNetChangeList");
	}

	/** 마스크를 착용한 남자의 비율 계산(금일)
	 * @return int
	 */
	public int maskManCount() {
		return sql.selectOne("cameraPageMapper.maskManCount");
	}

	
	/** 마스크를 착용한 여자의 비율 계산(금일)
	 * @return int
	 */
	public int maskWomanCount() {
		return sql.selectOne("cameraPageMapper.maskWomanCount");
	}

	/** 휴먼페이지 성별 도넛 차트
	 * @return list
	 */
	public List<DC_summary> genderTotalList() {
		return sql.selectList("cameraPageMapper.genderTotalList");
	}

	/** 휴먼페이지 성별 악세사리 막대&라인 혼합 차트
	 * @return list
	 */
	public List<DailyCount_summary> genderAccList() {
		return sql.selectList("cameraPageMapper.genderAccList");
	}
	
	
	
	
	
}
