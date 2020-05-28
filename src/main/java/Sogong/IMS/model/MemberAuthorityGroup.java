package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class MemberAuthorityGroup {
    AuthorityGroup authorityGroup;
    String memberID;
}