package Sogong.IMS.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Package {
    private String packageID;
    private String registrantID;
    private String company;
    private String type;
    private String explanation;
    private int price;
}
