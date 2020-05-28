package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PackagePurchaseHistoryByNonMember extends PackagePurchaseHistory {
    private String buyerName;
    private String buyerEmail;
    private String buyerPhoneNumber;
}
