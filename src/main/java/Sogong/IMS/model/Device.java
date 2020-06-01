package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Device {
    String facilityPropertyID;
    String deviceID;
    String registrantID;
    String deviceName;
    String instruction;
    int instructionCost;
}