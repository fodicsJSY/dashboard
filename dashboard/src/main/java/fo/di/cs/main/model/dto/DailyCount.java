package fo.di.cs.main.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class DailyCount {
	
	// 시간대별 라인차트 (금일)
	private int time; // 측정시간
	private int person; // 사람
	private int vehicle; // 차량
	private int face; // 얼글
	private int lpr; // 차량번호판
	private int invCnt; // 침입
	private int lotCnt; // 배회
	private int cntCnt; // 카운팅
	private int fatCnt; // 쓰러짐
	private int occuTime; // 시간
	
	
	//최다검지카메라 사람 테이블(금일)
	
	private String cameraName; // 카메라이름
	private int personCount; // 사람 수
	private int vehicleCount; // 차량 수
	private int faceCount; // 얼굴 수
	private int lprCount; // 차량번호판 수
	private int invCntCount; // 침입 수
	private int lotCntCount; //배회 수
	private int cntCntCount; // 카운팅 수
	private int falCntCount; // 쓰러짐 수
	
	
	// 최다검지카메라 차량 테이블(금일)

	private int carCount; // 자동차 수
	private int busCount; // 버스 수
	private int truckCount; // 트럭 수
	private int motocycleCount; // 오토바이 수
	private int bicycleCount; // 자전거 수
	
}
