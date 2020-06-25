package Sogong.IMS.model;

import java.sql.*;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor

public class FacilityProperty {
    String facilityPropertyID;
    String facilityID;
    String registrantID;
    Date openingDate;
    int facilityScale;
    int facilityCost;
    
    public FacilityProperty(String facilityPropertyID, String facilityID, String registrantID, Date openingDate, int facilityScale, int facilityCost){
        this.facilityPropertyID = facilityPropertyID;
        this.facilityID = facilityID;
        this.registrantID = registrantID;
        this.openingDate = openingDate;
        this.facilityScale = facilityScale;
        this.facilityCost = facilityCost;
    }

    public Date getOpeningDate(){
        return openingDate;
    }
    
}