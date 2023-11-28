package fo.di.cs.camera.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fo.di.cs.main.model.dto.DailyCount;

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
	
	
	
	
	
}
