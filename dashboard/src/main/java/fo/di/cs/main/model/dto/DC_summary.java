package fo.di.cs.main.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class DC_summary {
	
	private int face_youngMale; // 미성년 남자
	private int face_youngFemale; // 미성년 여자
	private int face_adultMale; // 성인 남자
	private int face_adultFemale; // 성인 여자
	private int face_middleMale; // 중년 남자
	private int face_middleFemale; // 중년 여자
	private int face_seniorMale; // 노년 남자
	private int face_seniorFemale; // 노년 여자
	private String occuDate; //날짜
	
	

}
