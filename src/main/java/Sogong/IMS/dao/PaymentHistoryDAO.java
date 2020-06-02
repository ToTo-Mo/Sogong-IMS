package Sogong.IMS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Date;
import java.util.HashMap;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import Sogong.IMS.model.PaymentHistory;

public class PaymentHistoryDAO {
    public boolean enroll(PaymentHistory paymentHistory) 
    {
        try {
            // DB 연결
            Connection conn = null;
            PreparedStatement stmt = null;

            Context context = new InitialContext();
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "INSERT INTO `PaymentHistory`(`paymentHistoryID`,`accomodationBookID`,`registantID`,`price`,`paymentMethod`, `paymentTime`) VALUES (?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1,paymentHistory.getPaymentHistoryID());
            stmt.setString(2,paymentHistory.getAccomodationBookHistoryID());
            stmt.setString(3,paymentHistory.getRegistrantID());
            stmt.setInt(4,paymentHistory.getPrice());
            stmt.setString(5,PaymentHistory.getPaymentMethod());
            stmt.setDate(6, Date.valueOf(PaymentHistory.getPaymentTime()));
            
            stmt.executeQuery();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public PaymentHistory[] lookup(HashMap<String,String> condition)
    {
        
        return null;
    }
    public boolean delete(PaymentHistory paymentHistory)
    {
        try 
        {
            Connection conn = null;
            PreparedStatement stmt = null;

            // META-INF아래 context.xml
            Context context = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            stmt = conn.prepareStatement(
                    "DELETE FROM `PaymentHistory` WHERE `memberID`=?");
            stmt.setString(1, paymentHistory.getPaymentHistoryID());
            
            return stmt.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }

        return false;
    }
    public boolean modify(PaymentHistory paymentHistory)
    {
        
        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            Context context = new InitialContext();
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();


            String sql = "UPDATE `sogongdo`.`example` SET `id` =?, `title` = ?, `createDate` = ? WHERE `id` = ?;";

            stmt = conn.prepareStatement(sql);

            stmt.setString(1,paymentHistory.getPaymentHistoryID());   
            stmt.setString(2,paymentHistory.getAccomodationBookHistoryID());
            stmt.setString(3,paymentHistory.getRegistrantID());
            stmt.setInt(4,paymentHistory.getPrice());
            stmt.setString(5,PaymentHistory.getPaymentMethod());
            stmt.setDatetime(6, LocalDateTime.valueOf(PaymentHistory.getPaymentTime()));

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }
}