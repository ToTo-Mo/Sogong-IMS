package Sogong.IMS.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Sogong.IMS.model.AccomodationBookHistory;
import Sogong.IMS.model.Member;

public class AccomodationBookHistoryDAO {
    public boolean enroll(AccomodationBookHistory accomodationBookHistory) {

        try {

            //DB 연결
            Connection conn = null;
            PreparedStatement stmt = null;

            //META-INF아래 context.xml
            Context context = new InitialContext();
            //DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
            /************************
             * `accomodationbookhistory` ( 
             * `accomodationBookHistoryID` varchar(20) NOT NULL,
             * `numOfPeople` int NOT NULL, 
             * `name` varchar(20) NOT NULL, 
             * `phoneNum` varchar(20) NOT NULL, 
             * `bookDate` date NOT NULL, 
             * `bookState` varchar(20) NOT NULL, 
             * `paymentPrice` int NOT NULL, 
             * `checkInTime` datetime NOT NULL,
             * `checkOutTime` datetime NOT NULL, 
             * `enteringState` varchar(20) NOT NULL,
             * `memberID` varchar(20) NOT NULL, 
             * `registrantID` varchar(20) NOT NULL,
             * `accomodationID` varchar(20) NOT NULL, 
             * `roomNum` int NOT NULL,
             ****************************/
            String sql = "INSERT INTO `accomodationbookhistory` VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, accomodationBookHistory.getAccomodationBookHistoryID());
            stmt.setInt(2, accomodationBookHistory.getNumOfPeople());
            stmt.setString(3, accomodationBookHistory.getName());
            stmt.setString(4, accomodationBookHistory.getPhoneNum());
            stmt.setObject(5, accomodationBookHistory.getBookDate());
            stmt.setString(6, accomodationBookHistory.getBookState());
            stmt.setInt(7, accomodationBookHistory.getPaymentPrice());
            stmt.setObject(8, accomodationBookHistory.getCheckInTime());
            stmt.setObject(9, accomodationBookHistory.getCheckOutTiem());
            stmt.setString(10, accomodationBookHistory.getEnteringState());
            stmt.setString(11, accomodationBookHistory.getMemberID());
            stmt.setString(12, accomodationBookHistory.getRegistrantID());
            stmt.setString(13, accomodationBookHistory.getAccomodationID());
            stmt.setInt(14, accomodationBookHistory.getRoomNum());

            stmt.execute();

            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

   

    public boolean modify(AccomodationBookHistory accomodationBookHistory){
        try {

            //DB 연결
            Connection conn = null;
            PreparedStatement stmt = null;

            //META-INF아래 context.xml
            Context context = new InitialContext();
            //DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
             /************************
             * `accomodationbookhistory` ( 
             * `accomodationBookHistoryID` varchar(20) NOT NULL,
             * `numOfPeople` int NOT NULL, 
             * `name` varchar(20) NOT NULL, 
             * `phoneNum` varchar(20) NOT NULL, 
             * `bookDate` date NOT NULL, 
             * `bookState` varchar(20) NOT NULL, 
             * `paymentPrice` int NOT NULL, 
             * `checkInTime` datetime NOT NULL,
             * `checkOutTime` datetime NOT NULL, 
             * `enteringState` varchar(20) NOT NULL,
             * `memberID` varchar(20) NOT NULL, 
             * `registrantID` varchar(20) NOT NULL,
             * `accomodationID` varchar(20) NOT NULL, 
             * `roomNum` int NOT NULL,
             ****************************/
            String sql = "UPDATE 'accomodationbookhistory' SET numOfPeople = ?,name = ?, phoneNum = ?,bookDate = ?,bookState = ?,paymentPrice = ?, checkInTime = ?, checkOutTime = ?, enteringState = ?,accomodationID = ?,roomNum = ?    WHERE accomodationBookHistoryID = ?";
            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, accomodationBookHistory.getNumOfPeople());
            stmt.setString(2, accomodationBookHistory.getName());
            stmt.setString(3, accomodationBookHistory.getPhoneNum());
            stmt.setObject(4, accomodationBookHistory.getBookDate());
            stmt.setString(5, accomodationBookHistory.getBookState());
            stmt.setInt(6,accomodationBookHistory.getPaymentPrice());
            stmt.setObject(7, accomodationBookHistory.getCheckInTime());
            stmt.setObject(8, accomodationBookHistory.getCheckOutTiem());
            stmt.setString(9, accomodationBookHistory.getEnteringState());
            stmt.setString(10, accomodationBookHistory.getRegistrantID());
            stmt.setInt(11, accomodationBookHistory.getRoomNum());

            stmt.setString(1, accomodationBookHistory.getAccomodationBookHistoryID());
            stmt.execute();

            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

    public boolean delete(AccomodationBookHistory accomodationBookHistory){
        try {

            //DB 연결
            Connection conn = null;
            PreparedStatement stmt = null;

            //META-INF아래 context.xml
            Context context = new InitialContext();
            //DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
           
            String sql = "DELETE FROM 'accomodationbookhistory' WHERE accomodationBookHistoryID = ?";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, accomodationBookHistory.getAccomodationBookHistoryID());
            stmt.execute();

            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

    public AccomodationBookHistory[] lookup() {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // db 연결 코드
            String url = "jdbc:mysql://totomo.iptime.org:3306/sogongdo?serverTimezone=UTC&zeroDateTimeBehavior=convertToNull";
            String id = "admin";
            String pwd = "tejava";

            conn = DriverManager.getConnection(url, id, pwd);

            stmt = conn.prepareStatement("SELECT * FROM accomodationbookhistory");
            rs = stmt.executeQuery();

            ArrayList<AccomodationBookHistory> accomodationBookHistories = new ArrayList<>();

            while(rs.next()){
               
                accomodationBookHistories.add(new AccomodationBookHistory(
                rs.getString("accomodationBookHistoryID") , rs.getInt("numOfPeople") ,
                rs.getString("name") , rs.getString("phoneNum"),rs.getObject("bookDate", LocalDate.class) , 
                rs.getString("bookState"), rs.getInt("paymentPrice"), rs.getObject("checkInTime", LocalDateTime.class), 
                rs.getObject("checkOutTiem", LocalDateTime.class), rs.getString("enteringState"), 
                rs.getString("memberID") , rs.getString("registrantID"), rs.getString("accomodationID"), rs.getInt("roomNum")));
            }

            return accomodationBookHistories.toArray(new AccomodationBookHistory[accomodationBookHistories.size()]);
            /*
            //META-INF아래 context.xml
            Context context = new InitialContext();
            //DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            StringBuilder builder = new StringBuilder();

            builder
                .append("SELECT * FROM ")
                .append("memberauthoritygroup ");


            // 조건 검색
            if (condition != null) {
                builder.append("WHERE ");

                // condition은 속성과 값으로 구성되어있다.
                // key : memberName,  value : 소공도 
                Iterator<String> iter = condition.keySet().iterator();

                while (iter.hasNext()) {
                    String key = iter.next();
                    builder.append(String.format("`%s`=%s ", key, condition.get(key)));

                    if (iter.hasNext())
                        builder.append("AND ");
                }
            }

            String sql = builder.toString();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            conn.close();

            ArrayList<Member> members = new ArrayList<>();

            while (rs.next()) {

            }
        */

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        // catch (NamingException e) {
        //     // TODO Auto-generated catch block
        //     e.printStackTrace();
        // }

        return null;
    }
}