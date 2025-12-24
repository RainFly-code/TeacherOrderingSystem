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

@WebServlet(name = "AdminRoomUpdateServlet", urlPatterns = "/AdminRoomUpdateServlet")
public class AdminRoomUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int editRoomId = Integer.parseInt(req.getParameter("roomId"));
        String editBnumber = req.getParameter("bnumber");
        String editFnumber = req.getParameter("fnumber");
        String editState = req.getParameter("state");
        String editTypename = req.getParameter("typename");

        Room room = new Room();
        room.setRoomid(editRoomId);
        room.setBnumber(Integer.parseInt(editBnumber));
        room.setFnumber(Integer.parseInt(editFnumber));
        room.setState(editState);
        room.setTypename(editTypename);
        AdminRoomService adminRoomService = new AdminRoomService();
        try {
            adminRoomService.updateRoom(room);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
