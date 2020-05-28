package Sogong.IMS.model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
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