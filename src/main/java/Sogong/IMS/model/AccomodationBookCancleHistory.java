package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class AccomodationBookCancleHistory {
    String accomodationBookCancleHistoryID;
    //DATE cancleDate
    String cancleReason;
    String registrantID;
    String accomodationBookHistoryID;
}