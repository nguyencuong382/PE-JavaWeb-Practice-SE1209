/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.DBContext;
import entity.Feature;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class FeatureDAO {

    public List<Feature> list(int roleId) throws Exception {
        List<Feature> roles;
        try (Connection conn = new DBContext().getConnection()) {
            roles = new ArrayList<>();
            String query = "select R.* from Feature_User RU\n"
                    + "inner join Features R on R.roleid = RU.roleid\n"
                    + "where RU.username = ?";

            PreparedStatement ps = conn
                    .prepareStatement(query);
//            ps.setInt(1, roleId);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                
            }
        }

        return roles;
    }
}
