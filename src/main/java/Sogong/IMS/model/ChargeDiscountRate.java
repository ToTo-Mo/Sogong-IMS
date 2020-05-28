package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ChargeDiscountRate {
    private String facilityiD;
    private String chargeName;
    private boolean isDiscount;
    private float discountRate;
    private String resistrantID;
}