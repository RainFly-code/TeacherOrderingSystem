package Servlet;

import Model.Admin;
import Service.AdminUserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminAddServlet", urlPatterns = "/AdminAddServlet")
public class AdminAddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int adminid = Integer.parseInt(req.getParameter("adminid"));
        String adminpassword = req.getParameter("adminPassword");
        Admin admin = new Admin();
        admin.setAdminId(adminid);
        admin.setPassword(adminpassword);
        AdminUserService adminUserService = new AdminUserService();
        try {
            adminUserService.InsertAdmin(admin);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
