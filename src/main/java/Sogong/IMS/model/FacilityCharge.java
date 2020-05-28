package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FacilityCharge {
    private String facilityID;
    private String chargeName;
    private int charge;
    private String resistrantID;
}