package Sogong.IMS.dao;

import Sogong.IMS.model.PackagePurchaseHistoryByMember;
import Sogong.IMS.model.PackagePurchaseHistoryByNonMember;

import java.util.HashMap;

public class PackagePurchaseHistoryByNonMemberDAO {
    private PackagePurchaseHistoryByNonMemberDAO() {}


    private static class LazyHolder {
        private static final PackagePurchaseHistoryByNonMemberDAO INSTANCE = new PackagePurchaseHistoryByNonMemberDAO();
    }
    public static PackagePurchaseHistoryByNonMemberDAO getInstance(){
        return LazyHolder.INSTANCE;
    }

    public boolean enroll(PackagePurchaseHistoryByNonMemberDAO packagePurchaseHistoryByNonMemberDAO){
        return false;
    }
    public PackagePurchaseHistoryByNonMember[] enroll(HashMap<String,String> conditions){
        return null;
    }
}
