package fo.di.cs.user.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class User {
	
	private String userId;
	private String userPw;
	private String userName;
	private int userBackup;
	private int userStatus;
	
	
	
	

}
