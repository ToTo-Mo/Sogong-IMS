package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class PackagePurchaseHistory {
    private Package aPackage;
    private Date purchaseDate;
    private int totalPrice;
    private String state;
    private String paymentMethod;
}
