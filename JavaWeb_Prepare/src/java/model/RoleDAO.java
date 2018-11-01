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

    public List<Role> list(String userName) throws Exception {
        List<Role> roles;
        try (Connection conn = new DBContext().getConnection()) {
            roles = new ArrayList<>();
            String query = "select * from Users U\n"
                    + "inner join Role_User RU on RU.username = U.username\n"
                    + "inner join Roles RO on RO.roleid = RU.roleid\n"
                    + "where U.username = ?";

            PreparedStatement ps = conn
                    .prepareStatement(query);
            ps.setString(1, userName);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("roleid");
                String roleName = resultSet.getString("rolename");
                roles.add(new Role(id, roleName));
            }
        }

        return roles;
    }

}
