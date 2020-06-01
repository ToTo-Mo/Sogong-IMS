package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentHistory {
    private String paymentHistoryID;
    private String accomodationBookHistoryID;
    private String registrantID;
    private int price;
    private String paymentMethod;
    //private Datetime paymentTime;
}