package Sogong.IMS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Sogong.IMS.model.AuthorityGroup;

public class AuthorityGroupDAO {

    public AuthorityGroup[] lookup() {
        try {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            Context context = new InitialContext();
            conn = ((DataSource) context.lookup("java:comp/env/jdbc/mysql")).getConnection();

            stmt = conn.prepareStatement("SELECT * FROM authoritygroup");
            rs = stmt.executeQuery();

            ArrayList<AuthorityGroup> authorityGroups = new ArrayList<>();

            while (rs.next()) {
                authorityGroups.add(AuthorityGroup.builder().authorityGroupSequence(rs.getInt("authorityGroupSequence"))
                        .authorityGroupName(rs.getString("authorityGroupName")).description(rs.getString("description"))
                        .build());
            }

            return authorityGroups.toArray(new AuthorityGroup[authorityGroups.size()]);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }
}