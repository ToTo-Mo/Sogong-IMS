package Sogong.IMS.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Sogong.IMS.model.Member;


public class MemberDAO {
	private static MemberDAO memberDAO = null;
	
	private MemberDAO() {	
	}
	
	public static MemberDAO getInstance() {
		if(memberDAO == null) memberDAO = new MemberDAO();
		return memberDAO;
	}
	
	public Vector<Member> select(HashMap<String, Object> condition) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("");
			Statement st = con.createStatement();
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("");
			if(condition.size() > 0) {
				if((condition.get("memberID") != null) || (condition.get("name") != null)) {
					stringBuilder.append("where");
					String memberID = condition.get("memberID") == null ? "" : (String)condition.get("memberID");
					String name = condition.get("name") == null ? "" : (String)condition.get("name");
					stringBuilder.append("memberID : " + memberID + "and name : " + name);
				}
			}
			System.out.println(stringBuilder.toString());
			Vector<Member> members = new Vector<>();
			ResultSet resultset = st.executeQuery(stringBuilder.toString());
			while(resultset.next()) {
				System.out.println(resultset.getString(1));
			}
			return members;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	boolean enroll(Member m) {
		try {
			Connection con = null;
			PreparedStatement st = null;
			
			Context context = new InitialContext();
			con = ((DataSource) context.lookup("\"java:comp/env/jdbc/mysql\"")).getConnection();
			
			String sql = "ISERT INTO `member` VALUES (?,?)";
			st = con.prepareStatement(sql);
			
			st.setString(1, m.getMemberID());
			st.setString(2, m.getMemberPW());
			st.setString(3, m.getName());
			st.setString(4, m.getPhoneNumber());
			st.setString(4, m.getAddress());
			st.setString(5, m.getEmail());
			st.setString(6, m.getMemberType());
			st.setString(7, m.getDepartment());
			
			st.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public Member[] lookup(HashMap<String,Object> condition) {
		try {
			Connection con = null;
			PreparedStatement st = null;
			ResultSet rs = null;
		
			Context context = new InitialContext();
			con = ((DataSource)context.lookup("java:comp/env/jdbc/mysql")).getConnection();
			
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("SELECT * FROM ").append("`example`");
			
			if(condition.size() > 0) {
				stringBuilder.append("WHERE ");
				
				Iterator<String> it = condition.keySet().iterator();
				
				while(it.hasNext()) {
					String columnName = it.next();
					Object val = condition.get(columnName);
					
					if(val instanceof String) {
						stringBuilder.append(String.format("`%s` LIKE '%%%s%%' ", columnName, (String)val));
					}
					if(it.hasNext()) stringBuilder.append("AND ");
				}
			}
			String sql = stringBuilder.toString();
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			
			ArrayList<Member> memList = new ArrayList<>();
			
			while(rs.next()) {
			}
			return memList.toArray(new Member[memList.size()]);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	boolean delete(Member m) {
		try {
			Connection con = null;
			PreparedStatement st = null;
			
			Context context = new InitialContext();
			con = ((DataSource)context.lookup("java:comp/env/jdbc/mysql")).getConnection();
			
			String sql = "Delete FROM `member` WHERE memberID = ?";
			st = con.prepareStatement(sql);
			
			st.setString(1,  m.getMemberID());
			st.execute();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	boolean modify(Member m) {
		try {
			Connection con = null;
			PreparedStatement st = null;
			
			Context context = new InitialContext();
			con = ((DataSource)context.lookup("java:comp/env/jdbc/mysql")).getConnection();
			
			st = con.prepareStatement("DELETE FROM `member` WHERE `memberID`=? AND `memberPW`=? AND `name`=? AND `phoneNumber`=? AND `address`=? AND `email`=?");
			st.setString(1, m.getMemberID());
			st.setString(2, m.getMemberPW());
			st.setString(3, m.getName());
			st.setString(4, m.getPhoneNumber());
			st.setString(5, m.getAddress());
			st.setString(6, m.getEmail());
			
			return st.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public Member login(String id, String pw) {
		return null;
	}
}
