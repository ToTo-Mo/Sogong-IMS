package Sogong.IMS.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Sogong.IMS.model.AuthorityGroup;

public class AuthorityGroupDAO {
    
    public AuthorityGroup[] lookup(){
        try {
            Connection conn = null;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://totomo.iptime.org:3306/sogongdo?serverTimezone=UTC&zeroDateTimeBehavior=convertToNull";
            String user = "admin";
            String password = "k^rEmQwG2c6=bvPC";

            conn = DriverManager.getConnection(url, user, password);
        
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM authoritygroup");
            ResultSet rs = stmt.executeQuery();
            
            ArrayList<AuthorityGroup> authorityGroups = new ArrayList<>();

            while(rs.next()){
                authorityGroups.add(
                    AuthorityGroup.builder()
                                .authorityGroupSequence(rs.getInt("authorityGroupSequence"))
                                .authorityGroupName(rs.getString("authorityGroupName"))
                                .description(rs.getString("description"))
                                .build()
                );
            }

            return authorityGroups.toArray(new AuthorityGroup[authorityGroups.size()]);
        
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }
}