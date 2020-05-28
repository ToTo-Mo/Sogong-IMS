package Sogong.IMS.dao;

import java.util.HashMap;

public class PackageDAO {
    private PackageDAO() {
    }

    private static class LazyHolder {
        private static final PackageDAO INSTANCE = new PackageDAO();
    }
    public static PackageDAO getInstance(){
        return LazyHolder.INSTANCE;
    }

    public boolean modify(Package aPackage){
        return false;

    }
    public boolean enroll(Package aPackage){
        return false;
    }
    public boolean delete(Package aPackage){
        return false;
    }
    public Package[] enroll(HashMap<String,String> conditions){
        return null;
    }

}
