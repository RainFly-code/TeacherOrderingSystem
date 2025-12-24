package Servlet;


import Model.User;
import Service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收请求
        int id = Integer.parseInt(req.getParameter("id"));
        String password = req.getParameter("password");

        //调用业务层
        UserService userService = new UserService();
        User user = userService.login(id,password);
        if(user == null){
            //登陆失败
            req.setAttribute("errors", "工号或密码错误，请重新登陆");
            req.getRequestDispatcher("/Login.jsp").forward(req, resp);
        }else {
            //登陆成功
            req.getSession().setAttribute("user", user); // 将用户信息存储在 session 中
            req.setAttribute("userid",user.getUserid());
            req.getRequestDispatcher("RoomServlet?typename=all").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
