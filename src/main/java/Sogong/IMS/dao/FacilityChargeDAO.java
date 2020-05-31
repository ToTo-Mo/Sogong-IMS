package Sogong.IMS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Sogong.IMS.model.FacilityCharge;

public class FacilityChargeDAO {
    public boolean enroll(FacilityCharge facilityCharge) {
        try {

            // DB연결
            Connection conn = null;
            PreparedStatement stmt = null;

            // META-INF아래 context.xml
            Context context  = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "INSERT INTO `facilitycharge`(`facilityID`, `chargeName`, `charge`, `resistrantID`) VALUES (?,?,?,)";
            stmt = conn.prepareStatement(sql);

            // 시설이름, 요금명, 요금, 등록자를 Value에 각각 지정
            stmt.setString(1, facilityCharge.getFacilityID());
            stmt.setString(2, facilityCharge.getChargeName());
            stmt.setInt(3, facilityCharge.getCharge());
            stmt.setString(4, facilityCharge.getResistrantID());

            stmt.execute();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }

        return false;
    }

    public FacilityCharge[] lookup(HashMap<String, String> condition) {
        try {
            
            // DB연결
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // META-INF아래 context.xml
            Context context  = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            StringBuilder builder = new StringBuilder();

            builder
                .append("")
                .append("");

            // 조건 검색
            if (condition != null) {
                builder.append("");

                // condition은 속성과 값으로 이루어져 있다.
                Iterator<String> iter = condition.keySet().iterator();

                while
            }

            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean modify(FacilityCharge facilityCharge) {
        return false;
    }

    public boolean delete(FacilityCharge facilityCharge) {
        return false;
    }
}