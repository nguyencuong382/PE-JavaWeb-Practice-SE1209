/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Role;
import entity.User_;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RoleDAO;
import model.RoleUserDAO;
import model.UserDAO;

/**
 *
 * @author Admin
 */
public class AddRole extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = request.getRequestDispatcher("/add.jsp");

        try {
            String userName = request.getParameter("userName");
            String roleId = request.getParameter("roleId");
            String save = request.getParameter("save");

            System.out.println("savce" + save);

            if (userName == null) {
                userName = "mra";
            }

            if (save != null) {
                new RoleUserDAO().insertRoleUser(Integer.parseInt(roleId), userName);
            }
            
            List<User_> users = new UserDAO().listAll();
            List<Role> rolesAvailable = new RoleDAO().getRemainRoles(userName);
            List<Role> rolesAdded = new RoleDAO().getAddedRoles(userName);
            request.setAttribute("users", users);
            request.setAttribute("rolesAvailable", rolesAvailable);
            request.setAttribute("rolesAdded", rolesAdded);

        } catch (Exception e) {
            System.out.println(e);
        }

        rd.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
