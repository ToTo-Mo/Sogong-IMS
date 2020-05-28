package Sogong.IMS.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import Sogong.IMS.model.Member;
import Sogong.IMS.model.MemberAuthorityGroup;

public class MemberAuthorityGroupDAO {

    public boolean enroll(MemberAuthorityGroup memberAuthorityGroup) {

        try {
            Connection conn = null;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://totomo.iptime.org:3306/sogongdo?serverTimezone=UTC&zeroDateTimeBehavior=convertToNull";
            String user = "admin";
            String password = "k^rEmQwG2c6=bvPC";

            conn = DriverManager.getConnection(url, user, password);
        
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO `memberauthoritygroup` VALUES (?,?)");
            stmt.setString(1, memberAuthorityGroup.getMemberID());
            stmt.setNull(2, memberAuthorityGroup.getAuthorityGroup().getAuthorityGroupSequence());

            stmt.execute();

            return true;
        
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

    public Member[] lookup(HashMap<String, String> condition){

        try {
            Connection conn = null;
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://totomo.iptime.org:3306/sogongdo?serverTimezone=UTC&zeroDateTimeBehavior=convertToNull";
            String user = "admin";
            String password = "k^rEmQwG2c6=bvPC";

            conn = DriverManager.getConnection(url, user, password);

            StringBuilder builder = new StringBuilder();

            builder
                .append("SELECT * FROM ")
                .append("memberauthoritygroup ");

            if(condition != null){
                builder.append("WHERE ");

                Iterator<String> iter = condition.keySet().iterator();

                while(iter.hasNext()){
                    String key = iter.next();
                    builder.append(String.format("`%s`=%s ", key,condition.get(key)));
    
                    if(iter.hasNext())
                        builder.append("AND ");
                }
            }
            
            String sql = builder.toString();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            ArrayList<Member> members = new ArrayList<>();

            while(rs.next()){

            }

            return members.toArray(new Member[members.size()]);
        
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    public boolean hasAuthority(Member member, String authorityCode){
        return false;
    }

    public boolean modify(MemberAuthorityGroup memberAuthorityGroup){
        return false;
    }

    public boolean delete(MemberAuthorityGroup memberAuthorityGroup){
        return false;
    }
}