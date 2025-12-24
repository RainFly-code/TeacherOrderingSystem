package Servlet;

import Model.Room;
import Model.User;
import Service.AdminRoomService;
import Service.AdminUserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminRoomServlet", urlPatterns = "/AdminRoomServlet")

public class AdminRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int adminroomid = Integer.parseInt(req.getParameter("Adminroomid"));
        AdminRoomService adminRoomService = new AdminRoomService();
        if(adminroomid == 0){
            List<Room> AdminRoomList = adminRoomService.SelectAllRoom();
            req.setAttribute("AdminRoomList",AdminRoomList);
            req.getRequestDispatcher("AdminRoom.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
