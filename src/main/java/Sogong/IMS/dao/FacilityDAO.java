package Sogong.IMS.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

import Sogong.IMS.model.Facility;

public class FacilityDAO {

    // Singleton - lazy holder
    private static class LazyHolder {
        private static final FacilityDAO dao = new FacilityDAO();
    }

    public static FacilityDAO getInstance() {
        return LazyHolder.dao;
    }

    public boolean enroll(Facility facility) {
        try {

            // DB연결
            Connection conn = null;
            PreparedStatement stmt = null;

            // META-INF아래 context.xml
            Context context = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "INSERT INTO `Facility`(`facilityID`, `resistrantID`, 'workspaceID', 'facilityName') VALUES (?,?,?,)";
            stmt = conn.prepareStatement(sql);

            // 시설 번호, 담당자, 사업장 번호, 시설 이름을 Value에 각각 지정
            stmt.setString(1, facility.getFacilityID());
            stmt.setString(2, facility.getRegistrantID());
            stmt.setString(3, facility.getWorkspaceID());
            stmt.setString(4, facility.getFacilityName());
            stmt.execute();

            return true;
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public Facility[] lookup(HashMap<String, Object> condtions) throws SQLException, NamingException {// DB연결
		Connection conn = null;
		PreparedStatement stmt = null;

		// META-INF아래 context.xml
		Context context = new InitialContext();
		// DB Connection
		conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
		
		
		String sql = "SELECT * FROM Facility";
		stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<Facility> list = new ArrayList<>();

        while (rs.next()) {
        	
        	String facilityID = rs.getString("facilitiyID");
            String registrantID = rs.getString("registrantID");
            String workspaceID= rs.getString("workspaceID");
    	    String facilityName = rs.getString("facilityName");

            list.add(
                new Facility(facilityID, registrantID, workspaceID, facilityName)
            );

        }

        return list.toArray(new Facility[list.size()]);
    }

    public boolean modify(Facility facility) throws SQLException, NamingException {
    	Connection conn = null;
		PreparedStatement stmt = null;

		// META-INF아래 context.xml
		Context context = new InitialContext();
		// DB Connection
		conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
		
		
		String sql = "UPDATE `sogongdo`.`Facility` SET `FacilityID` = ?, `registrantID` = ?, `WorkspaceID` = ?, `facilityName` = ? WHERE `FacilityID` = ?;";

        stmt = conn.prepareStatement(sql);

        stmt.setString(1,facility.getFacilityID());
        stmt.setString(2,facility.getRegistrantID());
        stmt.setString(3,facility.getWorkspaceID());
        stmt.setString(4,facility.getFacilityName());
        stmt.setString(5,facility.getFacilityID());

        return true;
    }

    public boolean delete(int i) {
		// DB연결
		Connection conn = null;
		PreparedStatement stmt = null;

		// META-INF아래 context.xml
		Context context;

		String sql = "delete from Facility where FacilityID=?";
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