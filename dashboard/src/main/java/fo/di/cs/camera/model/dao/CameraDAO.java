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
	
	
	
	/** 사람
	 * @return int
	 */
	public List<DailyCount> dailyPersonCount() {
		return sql.selectList("cameraPageMapper.dailyPersonCount");
	}

	/** 차량
	 * @return int
	 */
	public List<DailyCount> dailyVehicleCount() {
		return sql.selectList("cameraPageMapper.dailyVehicleCount");
	}

	/** 얼굴
	 * @return int
	 */
	public List<DailyCount> dailyFaceCount() {
		return sql.selectList("cameraPageMapper.dailyFaceCount");
	}

	/** 차량번호판
	 * @return int
	 */
	public List<DailyCount> dailyLprCount() {
		return sql.selectList("cameraPageMapper.dailyLprCount");
	}

	/** 침입
	 * @return int
	 */
	public List<DailyCount> dailyInvCntCount() {
		return sql.selectList("cameraPageMapper.dailyInvCntCount");
	}

	/** 배회
	 * @return int
	 */
	public List<DailyCount> dailyLotCntCount() {
		return sql.selectList("cameraPageMapper.dailyLotCntCount");
	}

	/** 카운팅
	 * @return int
	 */
	public List<DailyCount> dailyCntCntCount() {
		return sql.selectList("cameraPageMapper.dailyCntCntCount");
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

	/**긴 상의 남성 비율
	 * @return int
	 */
	public int longTopWearMan() {
		return sql.selectOne("cameraPageMapper.longTopWearMan");
	}

	/** 짧은 상의 남성 비율
	 * @return int
	 */
	public int shortTopWearMan() {
		return sql.selectOne("cameraPageMapper.shortTopWearMan");
	}

	/**긴 하의 남성 비율
	 * @return int
	 */
	public int longBottomWearMan() {
		return sql.selectOne("cameraPageMapper.longBottomWearMan");
	}

	/** 짧은 하의 남성 비율
	 * @return int
	 */
	public int shortBottomWearMan() {
		return sql.selectOne("cameraPageMapper.shortBottomWearMan");
	}

	/**긴 상의 여성 비율
	 * @return int
	 */
	public int longTopWearWoman() {
		return sql.selectOne("cameraPageMapper.longTopWearWoman");
	}

	/**짧은 상의 여성 비율
	 * @return int
	 */
	public int shortTopWearWoman() {
		return sql.selectOne("cameraPageMapper.shortTopWearWoman");
	}

	/**긴 하의 여성 비율
	 * @return int
	 */
	public int longBottomWearWoman() {
		return sql.selectOne("cameraPageMapper.longBottomWearWoman");
	}

	/**짧은 하의 여성 비율
	 * @return int
	 */
	public int shortBottomWearWoman() {
		return sql.selectOne("cameraPageMapper.shortBottomWearWoman");
	}

	/**무채색 상의 남성
	 * @return int
	 */
	public double monoTopWearMan() {
		return sql.selectOne("cameraPageMapper.monoTopWearMan");
	}

	/**난색 상의 남성
	 * @return int
	 */
	public double polyTopWearMan() {
		return sql.selectOne("cameraPageMapper.polyTopWearMan");
	}

	/** 한색 상의 남성
	 * @return int
	 */
	public double huesTopWearMan() {
		return sql.selectOne("cameraPageMapper.huesTopWearMan");
	}

	/**무채색 하의 남성
	 * @return int
	 */
	public double monoBottomWearMan() {
		return sql.selectOne("cameraPageMapper.monoBottomWearMan");
	}

	/**난색 하의 남성
	 * @return int
	 */
	public double polyBottomWearMan() {
		return sql.selectOne("cameraPageMapper.polyBottomWearMan");
	}

	/** 한색 하의 남성
	 * @return int
	 */
	public double huesBottomWearMan() {
		return sql.selectOne("cameraPageMapper.huesBottomWearMan");
	}

	/**
	 *  무채색 상의 여성
	 * @return int
	 */
	public double monoTopWearWoman() {
		return sql.selectOne("cameraPageMapper.monoTopWearWoman");
	}

	/**난색 상의 여성
	 * @return int
	 */
	public double polyTopWearWoman() {
		return sql.selectOne("cameraPageMapper.polyTopWearWoman");
	}

	/**한색 상의 여성
	 * @return int
	 */
	public double huesTopWearWoman() {
		return sql.selectOne("cameraPageMapper.huesTopWearWoman");
	}

	/**
	 *무채색 하의 여성
	 * @return int
	 */
	public double monoBottomWearWoman() {
		return sql.selectOne("cameraPageMapper.monoBottomWearWoman");
	}

	/**난색 하의 여성
	 * @return int
	 */
	public double polyBottomWearWoman() {
		return sql.selectOne("cameraPageMapper.polyBottomWearWoman");
	}

	/**한색 하의 여성
	 * @return int
	 */
	public double huesBottomWearWoman() {
		return sql.selectOne("cameraPageMapper.huesBottomWearWoman");
	}

	/** 자동차비율
	 * @return double
	 */
	public double carPercentage() {
		return sql.selectOne("cameraPageMapper.carPercentage");
	}

	/** 버스비율
	 * @return double
	 */
	public double busPercentage() {
		return sql.selectOne("cameraPageMapper.busPercentage");
	}

	/** 트럭비율
	 * @return double
	 */
	public double truckPercentage() {
		return sql.selectOne("cameraPageMapper.truckPercentage");
	}

	/** 오토바이비율
	 * @return double
	 */
	public double motorcyclePercentage() {
		return sql.selectOne("cameraPageMapper.motorcyclePercentage");
	}
 
	/** 자전거비율
	 * @return double
	 */
	public double cyclePercentage() {
		return sql.selectOne("cameraPageMapper.cyclePercentage");
	}

	
	
	
	
	
	
}
