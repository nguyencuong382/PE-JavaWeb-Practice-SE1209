/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.DBContext;
import entity.User_;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public List<User_> list(String query) throws Exception {
        List<User_> users = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn
                .prepareStatement(query);
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()) {
            String userName_ = resultSet.getString("username");
            String passWord_ = resultSet.getString("password");
            users.add(new User_(userName_, passWord_));
        }
        resultSet.close();
        conn.close();
        return users;
    }

    public User_ getUserByName(String userName) throws Exception {
        String query = "select * from Users where username = '" + userName + "'";
        List<User_> users = list(query);
        if (users.size() > 0) {
            return users.get(0);
        } else {
            return null;
        }
    }

    public User_ getUser(String userName, String passWord) throws Exception {
        String query = "SELECT * FROM Users";
        List<User_> users = list(query);

        for (User_ u : users) {
            if (userName.equalsIgnoreCase(u.getUserName()) && passWord.equals(u.getPassWord())) {
                return u;
            }
        }

        return null;
    }

    public List<User_> getAllUsers() throws Exception {
        String query = "select * from Users";
        return list(query);
    }
}
