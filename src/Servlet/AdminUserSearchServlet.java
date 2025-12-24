package Servlet;

import Model.Order;
import Model.User;
import Service.AdminOrderSearchService;
import Service.AdminUserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "AdminUserSearchServlet", urlPatterns = "/AdminUserSearchServlet")

public class AdminUserSearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchuserid = req.getParameter("searchuserid");
        AdminUserService adminUserService = new AdminUserService();
        List<User> searchuserList = adminUserService.GetAllUserByUserId(searchuserid);
        req.setAttribute("AdminUserList",searchuserList);
        req.getRequestDispatcher("/AdminUser.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
