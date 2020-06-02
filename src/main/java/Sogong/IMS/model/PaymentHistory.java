package Sogong.IMS.model;

import java.time.LocalDateTime;

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
    private LocalDateTime paymentTime;
}