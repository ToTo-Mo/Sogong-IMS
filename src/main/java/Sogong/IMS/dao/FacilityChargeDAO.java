package Sogong.IMS.dao;

import java.util.HashMap;

import Sogong.IMS.model.FacilityCharge;

public class FacilityChargeDAO {

    // Singleton - lazy holder
    private static class LazyHolder{
        private static final FacilityChargeDAO dao = new FacilityChargeDAO();
    }
    public static FacilityChargeDAO getInstance() {
        return LazyHolder.dao;
    }

    public boolean enroll(FacilityCharge facilityCharge) {
        return false;
    }

    public FacilityChargep[] lookup(HashMap<String, String> condition) {
        return null;
    }

    public boolean modify(FacilityCharge facilityCharge) {
        return false;
    }

    public boolean delete(FacilityCharge facilityCharge) {
        return false;
    }
}