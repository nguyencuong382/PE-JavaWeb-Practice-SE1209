/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.DBContext;
import entity.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RoleDAO {

    public List<Role> list(String query) throws Exception {
        List<Role> roles = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn
                .prepareStatement(query);
        ResultSet resultSet = ps.executeQuery();

        while (resultSet.next()) {
            Role r = new Role();
            r.setRoleId(resultSet.getInt("roleid"));
            r.setRoleName(resultSet.getString("rolename"));
            roles.add(r);
        }

        resultSet.close();
        conn.close();
        return roles;
    }

    public List<Role> getAllRoles() throws Exception {
        String query = "select * from Roles";
        return list(query);
    }

    public List<Role> getRemainRoles(String userName) throws Exception {
        String query = "select * from Roles\n"
                + "except\n"
                + "(select R.* from Role_User RU\n"
                + "inner join Roles R on RU.roleid = R.roleid\n"
                + "where RU.username = '" + userName + "')";
        return list(query);
    }

    public List<Role> getAddedRoles(String userName) throws Exception {
        String query = "select R.* from Role_User RU\n"
                + "inner join Roles R on RU.roleid = R.roleid\n"
                + "where RU.username = '" + userName + "'";
        return list(query);
    }
}
