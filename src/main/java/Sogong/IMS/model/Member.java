package Sogong.IMS.model;

public class Member {
    private String memberID;
    private String memberPW;
    private String name;
    private String phoneNumber;
    private String address;
    private String email;
    private String memberType;
    private String department;

    public Member(String memberID, String memberPW, String name, String phoneNumber, String address, String email, String memberType, String department) {
        this.memberID = memberID;
        this.memberPW = memberPW;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
        this.memberType = memberType;
        this.department = department;
    }

    public Member(String memberID, String memberPW, String name) {
        this.memberID = memberID;
        this.memberPW = memberPW;
        this.name = name;
    }

    public String getMemberID() {
        return memberID;
    }

    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }

    public String getMemberPW() {
        return memberPW;
    }

    public void setMemberPW(String memberPW) {
        this.memberPW = memberPW;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMemberType() {
        return memberType;
    }

    public void setMemberType(String memberType) {
        this.memberType = memberType;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}