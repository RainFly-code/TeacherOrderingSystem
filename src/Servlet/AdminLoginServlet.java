package Servlet;
import Model.Admin;
import Service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminLoginServlet", urlPatterns = "/AdminLoginServlet")

public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收请求
        int adminId = Integer.parseInt(req.getParameter("adminId"));
        String password = req.getParameter("password");

        //调用业务层
        AdminService adminService = new AdminService();
        Admin admin = adminService.login(adminId,password);
        if(admin == null){
            //登陆失败
            req.setAttribute("adminerrors", "管理员账号或密码错误，请重新登陆");
            req.getRequestDispatcher("/AdminLogin.jsp").forward(req, resp);
        }else {
            //登陆成功
            req.getSession().setAttribute("admin", admin);
            req.getRequestDispatcher("/AdminHome.jsp").forward(req, resp);
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
