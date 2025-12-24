package Servlet;

import Model.Room;
import Service.AdminRoomService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminRoomAddServlet", urlPatterns = "/AdminRoomAddServlet")
public class AdminRoomAddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int roomId = Integer.parseInt(req.getParameter("roomId"));
        String bnumber = req.getParameter("bnumber");
        String fnumber = req.getParameter("fnumber");
        String state = req.getParameter("state");
        String typename = req.getParameter("typename");

        Room room = new Room();
        room.setRoomid(roomId);
        room.setBnumber(Integer.parseInt(bnumber));
        room.setFnumber(Integer.parseInt(fnumber));
        room.setState(state);
        room.setTypename(typename);

        AdminRoomService adminRoomService = new AdminRoomService();
        try {
            adminRoomService.insertRoom(room);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
