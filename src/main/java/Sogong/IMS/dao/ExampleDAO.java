package Sogong.IMS.dao;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Sogong.IMS.model.Example;
import Sogong.IMS.model.MemberAuthorityGroup;

public class ExampleDAO {

    public boolean enroll(Example example) {

        try {
            // DB 연결
            Connection conn = null;
            PreparedStatement stmt = null;

            Context context = new InitialContext();
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            String sql = "INSERT INTO `example`(`title`,`createDate`) VALUES (?,CURRENT_TIMESTAMP)";
            stmt = conn.prepareStatement(sql);

            //id는 autoincrement이므로 추가하지 않습니다.
            stmt.setString(1, example.getTitle());

            stmt.executeUpdate();

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

    public Example[] lookup(HashMap<String, Object> condition) {

        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            Context context = new InitialContext();
            conn = ((DataSource)context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            // conn = DriverManager.getConnection("jdbc:mysql://totomo.iptime.org:3306/sogongdo?serverTimezone=UTC", "admin", "tejava");

            StringBuilder sqlBuilder = new StringBuilder();

            sqlBuilder.append("SELECT * FROM ")
                        .append("`example` ");

            // 조건 검색
            if (condition.size()>0) {
                sqlBuilder.append("WHERE ");

                // condition은 속성과 값으로 구성되어있다.
                // iter는 테이블 속성명이 들어있다.
                Iterator<String> iter = condition.keySet().iterator();

                while (iter.hasNext()) {
                    String columnName = iter.next();            //테이블의 속성명

                    Object value = condition.get(columnName);   //그 속성의 값

                    // 자료형이 String이나 Integer라면
                    if(value instanceof String || value instanceof Integer){
                        sqlBuilder.append(String.format("`%s` LIKE '%%%s%%' ", columnName, (String)value));
                    }

                    // 자료형이 LocalDate[]   여기에는 시작일과 종료일 둘다 있으므로 배열이 됩니다.
                    if(value instanceof LocalDate[]){
                        LocalDate[] dateRange = (LocalDate[])value;
                        sqlBuilder.append(String.format("`%s` BETWEEN '%s' AND  '%s'",columnName, dateRange[0].toString(),dateRange[1].toString()));
                    }

                    if (iter.hasNext())
                        sqlBuilder.append("AND ");
                }
            }

            String sql = sqlBuilder.toString();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            ArrayList<Example> exampleList = new ArrayList<>();

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

            String sql = "UPDATE `sogongdo`.`example` SET `title` = ?, `createDate` = ? WHERE `id` = ?;";

            stmt = conn.prepareStatement(sql);

            stmt.setString(1,example.getTitle());
            stmt.setDate(2,Date.valueOf(LocalDate.now()));
            stmt.setInt(3,example.getId());

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

    public boolean delete(Example example) {

        try {
			Connection con = null;
			PreparedStatement st = null;
			
			Context context = new InitialContext();
			con = ((DataSource)context.lookup("java:comp/env/jdbc/mysql")).getConnection();
			
			String sql = "Delete FROM `example` WHERE id = ?";
			st = con.prepareStatement(sql);
			
			st.setInt(1, example.getId());
			st.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
        return false;
    }
}