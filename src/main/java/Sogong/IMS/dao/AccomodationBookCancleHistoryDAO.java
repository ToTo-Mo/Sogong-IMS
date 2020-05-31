package Sogong.IMS.dao;

import Sogong.IMS.model.AccomodationBookCancleHistory;
import Sogong.IMS.model.Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AccomodationBookCancleHistoryDAO {
    public boolean enroll(AccomodationBookCancleHistory accomodationBookCancleHistory) {

        try {

            //DB 연결
            Connection conn = null;
            PreparedStatement stmt = null;

            //META-INF아래 context.xml
            Context context = new InitialContext();
            //DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            /*
             * `accomodationbookcanclehistory` ( 
             * `accomodationBookCancleHistoryID` varchar(20) NOT NULL, 
             * `cancleDate` date NOT NULL, 
             * `cancleReason` varchar(200) NOT NULL, 
             * `registrantID` varchar(20) NOT NULL, 
             * `accomodationBookHistoryID` varchar(20) NOT NULL,
             */
            String sql = "INSERT INTO `accomodationbookcanclehistory` VALUES (?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, accomodationBookCancleHistory.getAccomodationBookCancleHistoryID());
            stmt.setObject(2, accomodationBookCancleHistory.getCancleDate());
            stmt.setString(3, accomodationBookCancleHistory.getCancleReason());
            stmt.setString(4, accomodationBookCancleHistory.getRegistrantID());
            stmt.setString(5, accomodationBookCancleHistory.getAccomodationBookHistoryID());
         
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

   

    public boolean modify(AccomodationBookCancleHistory accomodationBookCancleHistory ){
        try {

            //DB 연결
            Connection conn = null;
            PreparedStatement stmt = null;

            //META-INF아래 context.xml
            Context context = new InitialContext();
            //DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();
            /*
             * `accomodationbookcanclehistory` ( 
             * `accomodationBookCancleHistoryID` varchar(20) NOT NULL, 
             * `cancleDate` date NOT NULL, 
             * `cancleReason` varchar(200) NOT NULL, 
             * `registrantID` varchar(20) NOT NULL, 
             * `accomodationBookHistoryID` varchar(20) NOT NULL,
             */
            String sql = "UPDATE 'accomodationbookhistory' SET cancleReason = ? WHERE accomodationBookHistoryID = ?";
            stmt = conn.prepareStatement(sql);

           
            stmt.setString(1, accomodationBookCancleHistory.getCancleReason());
            stmt.setString(2, accomodationBookCancleHistory.getAccomodationBookCancleHistoryID());
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

    public boolean delete(AccomodationBookCancleHistory accomodationBookCancleHistory){
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

            stmt.setString(1, accomodationBookCancleHistory.getAccomodationBookCancleHistoryID());
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

    public AccomodationBookCancleHistory[] lookup() {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // db 연결 코드
            String url = "jdbc:mysql://totomo.iptime.org:3306/sogongdo?serverTimezone=UTC&zeroDateTimeBehavior=convertToNull";
            String id = "admin";
            String pwd = "tejava";

            conn = DriverManager.getConnection(url, id, pwd);

            stmt = conn.prepareStatement("SELECT * FROM accomodationbookcanclehistory");
            rs = stmt.executeQuery();

            ArrayList<AccomodationBookCancleHistory> accomodationBookCancleHistories = new ArrayList<>();

            while(rs.next()){
               accomodationBookCancleHistories.add(new AccomodationBookCancleHistory(
                   rs.getString("accomodationBookCancleHistoryID") , rs.getObject("cancleDate", LocalDate.class), 
                   rs.getString("cancleReason"), rs.getString("registrantID"), rs.getString("accomodationBookHistoryID")));
              
            }

            return accomodationBookCancleHistories.toArray(new AccomodationBookCancleHistory[accomodationBookCancleHistories.size()]);
          

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
      

        return null;
    }
}