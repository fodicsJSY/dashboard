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
	
	

}
