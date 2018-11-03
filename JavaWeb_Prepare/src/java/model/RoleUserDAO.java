/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Admin
 */
public class RoleUserDAO {

    public void insertRoleUser(int roleId, String userName) throws Exception {
        String query = "INSERT INTO [PRJ321_Fall2018].[dbo].[Role_User]\n"
                + "           ([roleid]\n"
                + "           ,[username])\n"
                + "     VALUES\n"
                + "           (" + roleId + "\n"
                + "           ," + userName + ")";

        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn
                .prepareStatement(query);

        int n = ps.executeUpdate();
        ps.close();
        conn.close();
    }
}
