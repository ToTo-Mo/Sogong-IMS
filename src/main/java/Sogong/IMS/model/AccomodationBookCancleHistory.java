package Sogong.IMS.model;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
public class AccomodationBookCancleHistory {
    private String accomodationBookCancleHistoryID;
    private LocalDate cancleDate;
    private String cancleReason;
    private String registrantID;
    private String accomodationBookHistoryID;
}