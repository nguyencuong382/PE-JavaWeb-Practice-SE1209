/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.DBContext;
import entity.Feature;
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

    public List<Feature> getAllFeaturesByRoleId(int roleId) throws Exception {
        List<Feature> features;
        try (Connection conn = new DBContext().getConnection()) {
            features = new ArrayList<>();
            String query = "select F.* from Role_Feature RF\n"
                    + "	inner join Features F on F.featureid = RF.featureid\n"
                    + "where RF.roleid = " + roleId;

            PreparedStatement ps = conn
                    .prepareStatement(query);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int featureId = resultSet.getInt("featureid");
                String url = resultSet.getString("url");
                
                Feature f = new Feature(featureId, url);
                features.add(f);
            }
            ps.close();
            conn.close();
        }

        return features;

    }

    public List<Feature> list(int roleId) throws Exception {
        List<Feature> features;
        try (Connection conn = new DBContext().getConnection()) {
            features = new ArrayList<>();
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

        return features;
    }
}
