/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import entity.User_;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class Valid {
    public boolean isLogin(HttpServletRequest req, HttpServletResponse res) {
        User_ u = (User_) req.getSession().getAttribute("user");
        
        if(u == null) {
            return false;
        }
        
        return true;
    }
    
    public boolean isAdmin(HttpServletRequest req, HttpServletResponse res) {
        User_ u = (User_) req.getSession().getAttribute("user");
        
        if(u == null || !u.isAdmin()) {
            return false;
        }
        
        return true;
    }
   
}
