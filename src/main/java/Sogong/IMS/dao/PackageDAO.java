package Sogong.IMS.dao;
import Sogong.IMS.model.Package;
import java.sql.*;
import java.util.HashMap;
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

    public Vector<Package> select(HashMap<String,String> condiions){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://(host=djh20.iptime.org,port=3306,serverTimezone=UTC,allowMultiQueries=TRUE)/mydb?useUnicode=true&characterEncoding=utf8","djh20","dldd0525!@");
            Statement statement = conn.createStatement();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("select * from test.Package");
            if(condiions.size() > 0){
                if((condiions.get("minPrice") != null) || (condiions.get("maxPrice") != null)){
                    stringBuilder.append(" where ");
                    int maxPrice = condiions.get("maxPrice") == null ? 999999999 : Integer.parseInt(condiions.get("maxPrice"));
                    int minPrice = condiions.get("minPrice") == null ? 0 :Integer.parseInt(condiions.get("minPrice"));
                    stringBuilder.append("price < " +maxPrice  + " and price > " +  minPrice);
                }
            }
            System.out.println(stringBuilder.toString());
            Vector<Package> packages = new Vector<>();
            ResultSet resultset = statement.executeQuery(stringBuilder.toString());
            while(resultset.next()){
//                packages.add(new Package(resultset.getString(1), resultset.getInt(2),resultset.getString(3),resultset.getString(4)));
                System.out.println(resultset.getString(1));
            }
            return packages;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean delete(Package pkg) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://(host=djh20.iptime.org,port=3306,serverTimezone=UTC,allowMultiQueries=TRUE)/mydb?useUnicode=true&characterEncoding=utf8","djh20","dldd0525!@");
            Statement statement = conn.createStatement();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("delete from test.Package where packageName=");
            stringBuilder.append("'" + pkg+"'");
            return statement.execute(stringBuilder.toString());
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean enroll(Package pkg){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://(host=djh20.iptime.org,port=3306,serverTimezone=UTC,allowMultiQueries=TRUE)/mydb?useUnicode=true&characterEncoding=utf8","djh20","dldd0525!@");
            Statement statement = conn.createStatement();
            StringBuilder stringBuilder = new StringBuilder();
//            stringBuilder.append("insert into test.Package Values(");
//            stringBuilder.append("'" + pkg.get+"',");
//            stringBuilder.append(+ pkg.getPrice());
//            stringBuilder.append(",'" + pkg.getCompany()+"',");
//            stringBuilder.append("'" + pkg.getRegistrant() + "')");
            System.out.println(stringBuilder.toString());
            return statement.execute(stringBuilder.toString());
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
}
