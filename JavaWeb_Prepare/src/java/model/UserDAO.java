/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.DBContext;
import entity.User_;
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

    public User_ getUserByName(String userName) throws Exception {
        User_ user = null;
        Connection conn = new DBContext().getConnection();
        String query = "select * from Users where username = '"+userName+"'";
        ResultSet resultSet = conn
                .prepareStatement(query)
                .executeQuery();
        if (resultSet.next()) {
            String userName_ = resultSet.getString("username");
            String passWord_ = resultSet.getString("password");
            
            user = new User_(userName_, passWord_);
            
        }
        resultSet.close();
        conn.close();
        return user;
    }

    public User_ list(String userName, String passWord) throws Exception {
        User_ user = null;

        Connection conn = new DBContext().getConnection();
        String query = "SELECT * FROM Users";
        ResultSet resultSet = conn
                .prepareStatement(query)
                .executeQuery();
        if (resultSet.next()) {
            String userName_ = resultSet.getString("username");
            String passWord_ = resultSet.getString("password");
            System.out.println(userName_);
            if (userName.equalsIgnoreCase(userName_) && passWord.equals(passWord_)) {
                user = new User_(userName, passWord);
                return user;
            }
        }
        resultSet.close();
        conn.close();
        return user;
    }

    public List<User_> listAll() throws Exception {
        List<User_> users;
        Connection conn = new DBContext().getConnection();
        users = new ArrayList<>();
        String query = "select * from Users";

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
}
