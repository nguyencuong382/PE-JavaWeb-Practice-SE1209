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

    public List<Feature> list(String query) throws Exception {
        List<Feature> features;
        try (Connection conn = new DBContext().getConnection()) {
            features = new ArrayList<>();
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

    public List<Feature> getAllFeatures() throws Exception {
        String query = "select * from Features";
        return list(query);
    }

    public List<Feature> getAllFeaturesById(int featureId) throws Exception {
        String query = "select * from Features\n"
                + "where featureid = " + featureId;
        return list(query);
    }

    public List<Feature> getAllFeaturesByRoleId(int roleId) throws Exception {
        String query = "select F.* from Role_Feature RF\n"
                + "	inner join Features F on F.featureid = RF.featureid\n"
                + "where RF.roleid = " + roleId;
        return list(query);
    }

    public List<Feature> getFeaturesByUser(String userName) throws Exception {
        String query = "select F.* from Role_User RU\n"
                + "	inner join Role_Feature RF on RF.roleid = RU.roleid\n"
                + "	inner join Features F on RF.featureid = F.featureid\n"
                + "where RU.username = '" + userName + "'\n"
                + "group by F.featureid, F.url";
        return list(query);
    }

    public List<Feature> _list_(int roleId) throws Exception {
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
