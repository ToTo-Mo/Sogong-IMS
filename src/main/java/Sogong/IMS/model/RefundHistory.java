package Sogong.IMS.model;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RefundHistory {
    private String refundHistoryID;
    private String PaymentHistoryID;
    private String registrantID;
    private String resonsRefund;
    private int refundPrice;
    private LocalDateTime refundTime;
    private String refundMethod;
}