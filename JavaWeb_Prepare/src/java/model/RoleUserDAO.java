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

    public boolean insertRoleUser(int roleId, String userName) throws Exception {
        String query = "INSERT INTO Role_User\n"
                + "           (roleid\n"
                + "           ,username)\n"
                + "     VALUES\n"
                + "           (" + roleId + "\n"
                + "           ,'" + userName + "')";

        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn
                .prepareStatement(query);

        int n = ps.executeUpdate();
        ps.close();
        conn.close();

        return n > 0;
    }

    public boolean deleteRoleUser(int roleId, String userName) throws Exception {
        String query = "DELETE FROM Role_User\n"
                + "WHERE roleid = " + roleId + " and username= '" + userName + "'";

        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn
                .prepareStatement(query);

        int n = ps.executeUpdate();
        ps.close();
        conn.close();

        return n > 0;
    }

    public boolean updateRoleUser(String userName, int oldRoleId, int newRoleId) throws Exception {
        String query = "UPDATE Role_User\n"
                + "   SET roleid = "+newRoleId+"\n"
                + "WHERE roleid = "+oldRoleId+" and username= '"+userName+"'";

        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn
                .prepareStatement(query);

        int n = ps.executeUpdate();
        ps.close();
        conn.close();

        return n > 0;
    }

}
