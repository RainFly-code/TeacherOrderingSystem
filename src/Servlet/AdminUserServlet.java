package Servlet;

import Model.User;
import Service.AdminUserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminUserServlet", urlPatterns = "/AdminUserServlet")

public class AdminUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int adminuserid = Integer.parseInt(req.getParameter("Adminuserid"));
        AdminUserService adminUserService = new AdminUserService();
        if(adminuserid == 0){
            List<User> AdminUserList = adminUserService.SelectAllUser();
            req.setAttribute("AdminUserList",AdminUserList);
            req.getRequestDispatcher("AdminUser.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
