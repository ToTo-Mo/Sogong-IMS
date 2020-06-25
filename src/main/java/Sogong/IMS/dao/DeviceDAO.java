package Sogong.IMS.dao;

import java.util.ArrayList;
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
import Sogong.IMS.model.Device;

public class DeviceDAO {

    // Singleton - lazy holder
    private static class LazyHolder {
        private static final DeviceDAO dao = new DeviceDAO();
    }

    public static DeviceDAO getInstance() {
        return LazyHolder.dao;
    }

    public boolean enroll(Device device) throws NamingException {

            // DB연결
            Connection conn = null;
            PreparedStatement stmt = null;

            // META-INF아래 context.xml
            Context context = new InitialContext();
            // DB Connection
                		
            String sql = "insert into Device (DeviceID, registrantID, DeviceName, instruction, instructionCost, Device) values(?, ?, ?, ?, ?, ?)";
    		try {
    			context = new InitialContext();
    			conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
    			

    			stmt = conn.prepareStatement(sql);
    			stmt.setString(1, device.getDeviceID());
    			stmt.setString(2, device.getRegistrantID());
    			stmt.setString(3, device.getDeviceName());
    			stmt.setString(4, device.getInstruction());
    			stmt.setInt(5, device.getInstructionCost());
    			stmt.setString(6, device.getDeviceID());
    			stmt.executeUpdate();
   
    			return true;
    		} catch (NamingException | SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
            }
            return false;
    }

	public Device[] lookup(HashMap<String, Object> condtions) throws NamingException, SQLException {// DB연결
		Connection conn = null;
		PreparedStatement stmt = null;

		// META-INF아래 context.xml
		Context context = new InitialContext();
		// DB Connection
		conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
		
		
		String sql = "SELECT * FROM Device";
		stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<Device> list = new ArrayList<>();

        while (rs.next()) {
            
        	String facilityPropertyID = rs.getString("facilityPropertyID");
            String deviceID = rs.getString("DeviceID");
            String registrantID = rs.getString("registrantID");
            String deviceName = rs.getString("deviceName");
            String instruction = rs.getString("intruction");
            int instructionCost = rs.getInt("instructionCost");

            list.add(new Device(facilityPropertyID, deviceID, registrantID, deviceName, instruction, instructionCost));

        }

        return list.toArray(new Device[list.size()]);
	}

	public boolean modify(Device device) throws SQLException, NamingException {
		Connection conn = null;
		PreparedStatement stmt = null;

		// META-INF아래 context.xml
		Context context = new InitialContext();
		// DB Connection
		conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

		String sql = "UPDATE `sogongdo`.`Device` SET `DeviceID` = ?, `registrantID` = ?, `DeviceName` = ?, `instruction` = ?, `instructionCost` = ? WHERE `DeviceID` = ?;";

		stmt = conn.prepareStatement(sql);

		stmt.setString(1, device.getDeviceID());
		stmt.setString(2, device.getRegistrantID());
		stmt.setString(3, device.getDeviceName());
		stmt.setString(4, device.getInstruction());
		stmt.setInt(5, device.getInstructionCost());
		stmt.setString(6, device.getDeviceID());

        return true;
	}

	public boolean delete(int i) {
		// DB연결
		Connection conn = null;
		PreparedStatement stmt = null;

		// META-INF아래 context.xml
		Context context;

		String sql = "delete from Device where DeviceID=?";
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