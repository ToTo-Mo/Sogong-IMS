package Sogong.IMS.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Sogong.IMS.model.AuthorityGroup;
import Sogong.IMS.model.Example;
import Sogong.IMS.model.Member;
import Sogong.IMS.model.MemberAuthorityGroup;

public class ExampleDAO {

    public boolean enroll(Example example) {

        try {
            // DB 연결
            Connection conn = null;
            PreparedStatement stmt = null;

            Context context = new InitialContext();
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "INSERT INTO `example`(`id`,`title`,`createDate`) VALUES (?,?,?)";
            stmt = conn.prepareStatement(sql);

            stmt.setInt(1,Types.INTEGER);   //id는 autoincrement이므로 Types.INTEGER로 합니다.
            stmt.setString(2, example.getTitle());
            stmt.setDate(3, Date.valueOf(example.getCreateDate()));

            stmt.executeQuery();

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

    public Example[] lookup(HashMap<String, String> condition) {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            Context context = new InitialContext();
            conn = ((DataSource)context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            StringBuilder sqlBuilder = new StringBuilder();

            sqlBuilder.append("SELECT * FROM ")
                    .append("`example`");

            // 조건 검색
            if (condition.size()>0) {
                sqlBuilder.append("WHERE ");

                // condition은 속성과 값으로 구성되어있다.
                // iter는 테이블 속성명이 들어있다.
                Iterator<String> iter = condition.keySet().iterator();

                while (iter.hasNext()) {
                    String columnName = iter.next();

                    sqlBuilder.append(String.format("`%s` = '%s' ", columnName, condition.get(columnName)));

                    if (iter.hasNext())
                        sqlBuilder.append("AND ");
                }
            }

            String sql = sqlBuilder.toString();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            List<Example> exampleList = new ArrayList<>();

            while (rs.next()) {
                // 코드 처리부

                exampleList.add(
                                Example.builder()
                                        .id(rs.getInt("id"))
                                        .title(rs.getString("title"))
                                        .createDate(rs.getDate("createDate").toLocalDate())
                                        .build()
                );

            }

            return exampleList.toArray(new Example[exampleList.size()]);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    // 테이블 설계의 수정이 필요함
    public boolean modify(Example example) {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            Context context = new InitialContext();
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();


            String sql = "UPDATE `sogongdo`.`example` SET `id` =?, `title` = ?, `createDate` = ? WHERE `id` = ?;";

            // 이런 방식도 가능합니다.

            StringBuilder sqlBuilder = new StringBuilder();

            sqlBuilder.append("")

            stmt = conn.prepareStatement(sql);

            stmt.setInt(1,example.getId());
            stmt.setString(2,example.getTitle());
            stmt.setDate(3,Date.valueOf(example.getCreateDate()));

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