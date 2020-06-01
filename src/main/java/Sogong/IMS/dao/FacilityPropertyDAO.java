package Sogong.IMS.dao;

import java.util.HashMap;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Sogong.IMS.model.FacilityProperty;

public class FacilityPropertyDAO {

    // Singleton - lazy holder
    private static class LazyHolder {
        private static final FacilityPropertyDAO dao = new FacilityPropertyDAO();
    }

    public static FacilityPropertyDAO getInstance() {
        return LazyHolder.dao;
    }

    public boolean enroll(FacilityProperty facilityProperty) {
        try {

            // DB연결
            Connection conn = null;
            PreparedStatement stmt = null;

            // META-INF아래 context.xml
            Context context = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "INSERT INTO `FacilityProperty`(`facilityPropertyID`, `facilityID`, `resistrantID`, 'openingDate', 'facilityScale', 'facilityCost') VALUES (?,?,?,)";
            stmt = conn.prepareStatement(sql);

            // 시설 속성 번호, 시설 번호, 담당자, 개관일, 시설 규모, 시설 금액을 Value에 각각 지정
            stmt.setString(1, facilityProperty.getFacilityPropertyID());
            stmt.setString(2, facilityProperty.getFacilityID());
            stmt.setString(3, facilityProperty.getRegistrantID());
            //stmt.setString(4, facilityProperty.get());
            stmt.setInt(5, facilityProperty.getFacilityScale());
            stmt.setInt(6, facilityProperty.getFacilityCost());
            stmt.execute();

            return true;
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public FacilityProperty[] lookup(HashMap<String, String> condition) {
        return null;
    }

    public boolean modify(FacilityProperty facilityProperty) {
        return false;
    }

    public boolean delete(FacilityProperty facilityProperty) {
        return false;
    }
}