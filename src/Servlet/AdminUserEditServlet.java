package Servlet;

import Model.User;
import Service.AdminUserService;
import Service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
@WebServlet(name = "AdminUserEditServlet", urlPatterns = "/AdminUserEditServlet")

public class AdminUserEditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int updateuserid = Integer.parseInt(req.getParameter("updateuserid"));
        AdminUserService userService = new AdminUserService();
        User nowUser = userService.SelectAllUserByuserId(updateuserid);
        String jsonUser = "{"
                + "\"userid\":\"" + nowUser.getUserid() + "\","
                + "\"name\":\"" + nowUser.getName() + "\","
                + "\"password\":\"" + nowUser.getPassword() + "\","
                + "\"department\":\"" + nowUser.getDepartment() + "\","
                + "\"pnumber\":\"" + nowUser.getPnumber() + "\""
                + "}";
        req.setAttribute("nowUser",nowUser);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        // 将 JSON 字符串写入响应
        resp.getWriter().write(jsonUser);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
