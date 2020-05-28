package Sogong.IMS.dao;

import Sogong.IMS.model.PackagePurchaseHistoryByMember;

import java.util.HashMap;

public class PackagePurchaseHistoryByMemberDAO {
    private PackagePurchaseHistoryByMemberDAO() {}
    private static class LazyHolder {
        private static final PackagePurchaseHistoryByMemberDAO INSTANCE = new PackagePurchaseHistoryByMemberDAO();
    }
    public static PackagePurchaseHistoryByMemberDAO getInstance(){
        return LazyHolder.INSTANCE;
    }


    public boolean enroll(PackagePurchaseHistoryByMember packagePurchaseHistoryByMember){
        return false;
    }

    public PackagePurchaseHistoryByMember[] enroll(HashMap<String,String> conditions){
        return null;
    }

}
