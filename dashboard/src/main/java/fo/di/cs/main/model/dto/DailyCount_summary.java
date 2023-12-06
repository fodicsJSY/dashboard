package fo.di.cs.main.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class DailyCount_summary {
	
	private int faceNoMaskMaleYoung; // 마스크미착용_남자_미성년
	private int faceNoMaskMaleAdlut; //  마스크미착용_남자_성인
	private int faceNoMaskMaleMiddle; // 마스크미착용_남자_중년
	private int faceNoMaskMaleSenior; // 마스크미착용_남자_노년
	private int faceNoMaskFemaleYoung; // 마스크미착용_여자_미성년
	private int faceNoMaskFemaleAdult; // 마스크미착용_여자_성인
	private int faceNoMaskFemaleMiddle; // 마스크미착용_여자_중년
	private int faceNoMaskFemaleSenior; // 마스크미착용_여자_노년
	private String occuDate; //날짜
	
	
	private int person; // 사람 
	private int vehicle; // 차량
	private int face; // 얼굴
	private int lpr; // 차량번호판
	private int invCnt; // 침입
	private int lotCnt; // 베회
	private int cntCnt; // 카운팅
	private int falCnt; // 쓰러짐
	
	private int car; // 자동차
	private int bus; // 버스
	private int truck; // 트럭
	private int motocycle; // 오토바이
	private int bicycle; // 자전거

	private int hatMale; // 모자 쓴 남성
	private int bagMale; // 가방 맨 남성
	private int hatFemale; // 모자 쓴 여성
	private int bagFemale; // 가방 맨 여성
	
	private int femaleFace; // 여자얼굴
	private int maleFace; // 남자얼굴
	
	private int faceHatMale; // 모자 쓴 남자얼굴
	private int faceHatFemale; // 모자 쓴 여자얼굴
	private int faceGrassesMale; // 안경 쓴 남자얼굴
	private int faceGrassesFemale; // 안경 쓴 여자얼굴
	private int faceMaskMale; // 마스크 쓴 남자얼굴
	private int faceMaskFemale; // 마스크 쓴 여자얼굴
	
	
	
}
