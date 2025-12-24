package Servlet;

import Model.Room;
import Service.RoomService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "RoomServlet", urlPatterns = "/RoomServlet")
public class RoomServlet extends HttpServlet {
    private RoomService roomService = new RoomService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String typename = new String();
        if(req.getParameter("typename")!=null)
        {
            typename=req.getParameter("typename");
        }
        int count1 = roomService.GetAllCount();
        int count2 = roomService.getAllOrderCount();
        int count3 = roomService.getAllRepairCount();
        int count4 = roomService.getAllOccupiedCount();
        req.setAttribute("count1",count1);
        req.setAttribute("count2",count2);
        req.setAttribute("count3",count3);
        req.setAttribute("count4",count4);
        if(Objects.equals(typename, "all")){
            List<Room> roomList = roomService.GetAllRoom();
            req.setAttribute("roomList", roomList);
            req.getRequestDispatcher("AllRoom.jsp").forward(req, resp);
        }else {
            List<Room> roomList = roomService.GetTypeRoom(typename);
            req.setAttribute("typename",typename);
            req.setAttribute("roomList", roomList);
            req.getRequestDispatcher("TypeRoom.jsp").forward(req, resp);
        }
    }
}
