package Sogong.IMS.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Facility {

    private String facilityID;
    private String registrantID;
    private String workspaceID;
    private String facilityName;

}