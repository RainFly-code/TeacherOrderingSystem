package Servlet;

import Model.Room;
import Service.AdminRoomService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminRoomSearchServlet", urlPatterns = "/AdminRoomSearchServlet")
public class AdminRoomSearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchRoomId = req.getParameter("searchRoomId");
        AdminRoomService adminRoomService = new AdminRoomService();
        List<Room> searchRoomList = adminRoomService.getAllRoomsByRoomId(searchRoomId);
        req.setAttribute("AdminRoomList", searchRoomList);
        req.getRequestDispatcher("/AdminRoom.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
