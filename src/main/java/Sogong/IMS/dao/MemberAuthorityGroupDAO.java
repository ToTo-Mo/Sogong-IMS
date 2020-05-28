package Sogong.IMS.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Sogong.IMS.model.Member;
import Sogong.IMS.model.MemberAuthorityGroup;

public class MemberAuthorityGroupDAO {

    public boolean enroll(MemberAuthorityGroup memberAuthorityGroup) {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;

            //META-INF아래 context.xml
            Context context = new InitialContext();
            //DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "INSERT INTO `memberauthoritygroup` VALUES (?,?)";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, memberAuthorityGroup.getMemberID());
            stmt.setNull(2, memberAuthorityGroup.getAuthorityGroup().getAuthorityGroupSequence());

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

    public Member[] lookup(HashMap<String, String> condition) {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

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

            ArrayList<Member> members = new ArrayList<>();

            while (rs.next()) {

            }

            return members.toArray(new Member[members.size()]);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
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