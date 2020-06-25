package Sogong.IMS.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import java.sql.*;

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
			stmt.setDate(4, facilityProperty.getOpeningDate());
			stmt.setInt(5, facilityProperty.getFacilityScale());
			stmt.setInt(6, facilityProperty.getFacilityCost());
			stmt.execute();

			return true;
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public FacilityProperty[] lookup(HashMap<String, Object> condtions) throws NamingException, SQLException {

		// DB연결
		Connection conn = null;
		PreparedStatement stmt = null;

		// META-INF아래 context.xml
		Context context = new InitialContext();
		// DB Connection
		conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
		
		
		String sql = "SELECT * FROM FacilityProperty";
		stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<FacilityProperty> list = new ArrayList<>();

        while (rs.next()) {
            String facilityPropertyID= rs.getString("facilityPropertyID");
            String facilityID = rs.getString("facilitiyID");
            String registrantID = rs.getString("registrantID");
            
        	Date openingDate = rs.getDate("registrantID");
            int facilityScale = rs.getInt("facilityScale");
            int facilityCost = rs.getInt("facilityCost");

            list.add(
                new FacilityProperty(facilityPropertyID,facilityID, registrantID,openingDate,facilityScale,facilityCost)
            );

        }

        return list.toArray(new FacilityProperty[list.size()]);

	}

	public boolean modify(FacilityProperty facilityProperty) throws NamingException, SQLException {

		// DB연결
		Connection conn = null;
		PreparedStatement stmt = null;

		// META-INF아래 context.xml
		Context context = new InitialContext();
		// DB Connection
		conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
		
		String sql = "UPDATE `sogongdo`.`FacilityProperty` SET `facilityPropertyID` = ?, `facilityID` = ?, `registrantID` = ?, `OpeningDate` = ?, `facilityScale` = ?, `facilityCost` = ?WHERE `FacilityPropertyID` = ?;";

        stmt = conn.prepareStatement(sql);

        stmt.setString(1,facilityProperty.getFacilityPropertyID());
        stmt.setString(2,facilityProperty.getFacilityID());
        stmt.setString(3,facilityProperty.getRegistrantID());
        stmt.setDate(4,facilityProperty.getOpeningDate());
        stmt.setInt(5,facilityProperty.getFacilityScale());
        stmt.setInt(6,facilityProperty.getFacilityCost());
        stmt.setString(7,facilityProperty.getFacilityPropertyID());


		return true;
	}

	public boolean delete(int i) {

		// DB연결
		Connection conn = null;
		PreparedStatement stmt = null;

		// META-INF아래 context.xml
		Context context;

		String sql = "delete from FacilityProperty where FacilityPropertyID=?";
		try {
			context = new InitialContext();
			conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, i);
			return true;
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
}