package Sogong.IMS.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Sogong.IMS.model.AuthorityGroup;
import Sogong.IMS.model.Member;
import Sogong.IMS.model.MemberAuthorityGroup;

public class exampleDAO {

    public boolean enroll(MemberAuthorityGroup memberAuthorityGroup) {

        try {

            // DB 연결
            Connection conn = null;
            PreparedStatement stmt = null;

            // META-INF아래 context.xml
            Context context = new InitialContext();
            // DB Connection
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

            Context context = new InitialContext();
            conn = ((DataSource)context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            StringBuilder builder = new StringBuilder();

            builder.append("SELECT * FROM ")
                    .append("테이블명");

            // 조건 검색
            if (condition.size()>0) {
                builder.append("WHERE ");

                // condition은 속성과 값으로 구성되어있다.
                // key는 테이블 column명 , value는 값
                Iterator<String> iter = condition.keySet().iterator();

                while (iter.hasNext()) {
                    String key = iter.next();

                    builder.append(String.format("`result`.`%s` = '%s' ", key, condition.get(key)));

                    if (iter.hasNext())
                        builder.append("AND ");
                }
            }

            String sql = builder.toString();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                // 코드 처리부
            }

            // 반환할 자료형을 넣어주세요;
            return null;

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    public boolean hasAuthority(Member member, String authorityGroupName) {
        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // META-INF아래 context.xml
            Context context = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "SELECT 1 FROM (SELECT memberID, authorityGroupName FROM memberauthoritygroup JOIN authoritygroup ON memberauthoritygroup.authorityGroupSequence=authoritygroup.authorityGroupSequence) as `table` WHERE `table`.memberID=? AND `table`.authorityGroupName=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, member.getMemberID());
            stmt.setString(2, authorityGroupName);

            rs = stmt.executeQuery();

            if (rs.next())
                return true;
            else
                return false;

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

    // 테이블 설계의 수정이 필요함
    public boolean modify(MemberAuthorityGroup memberAuthorityGroup) {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // META-INF아래 context.xml
            Context context = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

    public boolean delete(MemberAuthorityGroup memberAuthorityGroup) {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;

            // META-INF아래 context.xml
            Context context = new InitialContext();
            // DB Connection
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            stmt = conn.prepareStatement(
                    "DELETE FROM `memberauthoritygroup` WHERE `memberID`=? AND `authorityGroupSequence`=?");
            stmt.setString(1, memberAuthorityGroup.getMemberID());
            stmt.setInt(2, memberAuthorityGroup.getAuthorityGroup().getAuthorityGroupSequence());

            return stmt.execute();

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