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
import Sogong.IMS.model.Device;

public class DeviceDAO {

    // Singleton - lazy holder
    private static class LazyHolder {
        private static final DeviceDAO dao = new DeviceDAO();
    }

    public static DeviceDAO getInstance() {
        return LazyHolder.dao;
    }

    public boolean enroll(Device device) {
        try {

            // DB연결
            Connection conn = null;
            PreparedStatement stmt = null;

            // META-INF아래 context.xml
            Context context = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "INSERT INTO `Device`(`deviceID`, `registrantID`, `facilityPropertyID`, 'deviceName', 'instruction', 'instructionCost') VALUES (?,?,?,)";
            stmt = conn.prepareStatement(sql);

            // 장치 번호, 담당자, 시설 속성 번호, 장치 이름, 도입처, 도입 금액을 Value에 각각 지정
            stmt.setString(1, device.getDeviceID());
            stmt.setString(2, device.getRegistrantID());
            stmt.setString(3, device.getFacilityPropertyID());
            stmt.setString(4, device.getDeviceName());
            stmt.setString(5, device.getInstruction());
            stmt.setInt(6, device.getInstructionCost());
            stmt.execute();

            return true;
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Device[] lookup(HashMap<String, String> condition) {
        return null;
    }

    public boolean modify(Device device) {
        return false;
    }

    public boolean delete(Device device) {
        return false;
    }
}