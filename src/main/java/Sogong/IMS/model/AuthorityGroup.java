package Sogong.IMS.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@Builder
public class AuthorityGroup {
    int authorityGroupSequence;
    String authorityGroupName;
    String description;
}