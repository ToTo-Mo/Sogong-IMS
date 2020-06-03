package Sogong.IMS.dao;
import Sogong.IMS.model.Package;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Vector;

public class PackageDAO {
    private static PackageDAO packageDAO = null;

    private PackageDAO() {
    }
    public static PackageDAO getInstance(){
        if(packageDAO == null)
            packageDAO = new PackageDAO();
        return packageDAO;
    }

    public Package[] lookup(HashMap<String, Object> conditions) throws NamingException, SQLException, ClassNotFoundException {
        System.out.println("Dasdasdsa");
        Connection conn = null;
        ResultSet rs = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://totomo.iptime.org:3306/sogongdo?serverTimezone=UTC", "admin", "tejava");
        Statement statement = conn.createStatement();
//        statement.executeQuery();
        StringBuilder query = new StringBuilder();
        query.append("select * from sogongdo.package");
        Iterator<String> iter = conditions.keySet().iterator();
        if (conditions.size() > 0)
            query.append(" where ");
//        int[] priceRange = {conditions.get("packageMinPrice") != null ? Integer.parseInt((String) conditions.get("packageMinPrice")) : 0,
//                conditions.get("packageMaxPrice") != null ? Integer.parseInt((String) conditions.get("packageMinPrice")) : 999999999};
//        conditions.remove("packageMinPrice");
//        conditions.remove("packageMaxPrice");
//        conditions.put("price", priceRange);
        while (iter.hasNext()) {
            String key = iter.next();            //테이블의 속성명
            Object value = conditions.get(key);
            if (value instanceof String || value instanceof Integer)
                query.append(String.format("`%s` LIKE '%%%s%%'", key, (String) value));
            if (value instanceof int[]) {
                int[] range = (int[]) value;
                query.append(String.format("`%s` BETWEEN %d AND %d", key, range[0], range[1]));
            }
            if (iter.hasNext())
                query.append(" and ");
        }
        System.out.println(query.toString());
        ResultSet resultSet = statement.executeQuery(query.toString());
        ArrayList<Package> packages = new ArrayList<>();
        while(resultSet.next()){
            packages.add(new Package(resultSet.getString("packageID"),resultSet.getString("packageName"),resultSet.getString("registrantID"),resultSet.getString("company"),
                    resultSet.getString("type"),resultSet.getString("explanation"),resultSet.getInt("price")));
        }
        conn.close();
        return packages.toArray(new Package[packages.size()]);
    }
}
