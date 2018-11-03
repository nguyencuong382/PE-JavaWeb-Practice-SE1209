/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
import model.RoleDAO;

/**
 *
 * @author Admin
 */
public class User_ {
    private String userName;
    private String passWord;

    public User_() {
    }

    public User_(String name, String passWord) {
        this.userName = name;
        this.passWord = passWord;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
    
    
    public List<Role> getRoles() throws Exception {
        return new RoleDAO().getAddedRoles(userName);
    }
    
}
