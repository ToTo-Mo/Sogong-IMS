package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Member {
	private String memberID;
	private String memberPW;
	private String name;
	private String phoneNumber;
	private String address;
	private String email;
	private String memberType;
	private String department;
}
