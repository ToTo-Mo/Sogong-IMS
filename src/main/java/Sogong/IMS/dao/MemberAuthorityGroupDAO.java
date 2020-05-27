package Sogong.IMS.dao;

import java.util.HashMap;

import Sogong.IMS.model.MemberAuthorityGroup;

public class MemberAuthorityGroupDAO {

    // Singleton - lazy holder
    private static class LazyHolder{
        private static final MemberAuthorityGroupDAO dao = new MemberAuthorityGroupDAO();
    }
    public static MemberAuthorityGroupDAO getInstance(){
        return LazyHolder.dao;
    }
    
    public boolean enroll(MemberAuthorityGroup memberAuthorityGroup){
        return false;
    }

    public Member[] lookup(HashMap<String, String> condition){
        return null;
    }

    public boolean hasAuthority(Member member, String authorityCode){
        return false;
    }

    public boolean modify(MemberAuthorityGroup memberAuthorityGroup){
        return false;
    }

    public boolean delete(MemberAuthorityGroup memberAuthorityGroup){
        return false;
    }
}