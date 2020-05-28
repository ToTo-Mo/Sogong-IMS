package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PackagePurchaseHistoryByMember extends PackagePurchaseHistory {
    private Member member;
}
