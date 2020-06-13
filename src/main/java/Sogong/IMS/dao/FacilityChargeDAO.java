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

            String sql = "INSERT INTO `facilitycharge`(`facilityID`, `chargeName`, `charge`, `isDiscount`, `discountRate`, `resistrantID`) VALUES (?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);

            // 시설ID, 요금명, 요금, 할인여부, 할인율, 등록자ID를 각 인덱스 파라미터에 등록
            stmt.setString(1, facilityCharge.getFacilityID());
            stmt.setString(2, facilityCharge.getChargeName());
            stmt.setInt(3, facilityCharge.getCharge());
            stmt.setString(4, facilityCharge.getResistrantID());

            stmt.executeUpdate();

            return true;
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }

        return false;
    }

    // TODO lookup 메소드 구현 필요
    // 관광지명, 시설명을 조건으로 해당 시설의 요금 조회
    // 추가적으로 요금명, 등록자를 추가하여 조회 가능
    public FacilityCharge[] lookup(HashMap<String, Object> condition) {

        try {
            // DB연결
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // META-INF아래 context.xml
            Context context  = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            StringBuilder sqlBuilder = new StringBuilder();

            sqlBuilder.append("SELECT * FROM facilitycharge");

            if (condition.size() > 0) {
                sqlBuilder.append("WHERE ");

                // condition은 속성과 값으로 구성되어있다.
                // iter는 테이블 속성명이 들어있다.
                Iterator<String> iter = condition.keySet().iterator();

                while(iter.hasNext()) {
                    String columnName = iter.next();            // 테이블의 속성명
                    Object value = condition.get(columnName);   // 그 속성의 값
                }
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean modify(FacilityCharge facilityCharge) {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;

            Context context = new InitialContext();
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "UPDATE `facilitycharge` SET `chargeName` = ?,`charge`= ?,`isDiscount` = ?,`discountRate` = ? WHERE 'facilityID' = ?";
            // UPDATE `facilitycharge` SET `facilityID`=[value-1],`chargeName`=[value-2],`charge`=[value-3],`resistrantID`=[value-4] WHERE 1
            // UPDATE `chargediscountrate` SET `facilityID`=[value-1],`chargeName`=[value-2],`isDiscount`=[value-3],`discountRate`=[value-4],`registrantID`=[value-5] WHERE 1

            stmt = conn.prepareStatement(sql);

            stmt.setString(1, facilityCharge.getChargeName());
            stmt.setInt(2, facilityCharge.getCharge());
            stmt.setBoolean(3, facilityCharge.isDiscount());
            stmt.setFloat(4, facilityCharge.getDiscountRate());
            stmt.setString(5, facilityCharge.getFacilityID());

            stmt.executeUpdate();
            return true;

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean delete(FacilityCharge facilityCharge) {
        
        try {
            Connection conn = null;
            PreparedStatement stmt = null;

            Context context = new InitialContext();
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "DELETE FROM `facilitycharge WHERE ?`";
            // DELETE FROM `facilitycharge` WHERE 0
            // DELETE FROM `chargediscountrate` WHERE 0

            stmt = conn.prepareStatement(sql);

            stmt.setString(1, facilityCharge.getFacilityID());

            stmt.executeUpdate();
            return true;
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
        return false;
    }
}