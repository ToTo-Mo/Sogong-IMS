package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AccomodationBookHistory {
    String accomodationBookHistoryID;
    int numOfPeople;
    String name;
    String phoneNum;
    //DATE bookDate
    String bookState;
    int paymentPrice;
    //DATETIME checkInTime
    //DATETIME checkOutTiem
    String enteringState;
    String memberID;
    String registrantID;
    String accomodationID;
    int roomNum;
}