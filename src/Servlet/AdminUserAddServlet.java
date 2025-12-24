package Servlet;

import Model.User;
import Service.AdminUserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminUserAddServlet", urlPatterns = "/AdminUserAddServlet")

public class AdminUserAddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int edituserId = Integer.parseInt(req.getParameter("userid"));
        String editname = req.getParameter("name");
        String editpassword = req.getParameter("password");
        String editdepartment = req.getParameter("department");
        String editpnumber = req.getParameter("pnumber");
        User user = new User();
        user.setUserid(edituserId);
        user.setName(editname);
        user.setPassword(editpassword);
        user.setDepartment(editdepartment);
        user.setPnumber(editpnumber);
        AdminUserService adminUserService = new AdminUserService();
        try {
            adminUserService.InsertUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
