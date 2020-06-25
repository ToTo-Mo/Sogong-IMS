package Sogong.IMS.model;

import lombok.*;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FacilityCharge {
    private Workspace workspaceID;
    private Facility facilityID;
    private String chargeName;
    private int charge;
    private boolean isDiscount;
    private float discountRate;
    private String resistrantID;
}