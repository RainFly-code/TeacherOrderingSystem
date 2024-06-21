package Servlet;

import Model.Room;
import Model.Type;
import Service.RoomService;
import Service.TypeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.swing.tree.RowMapper;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllRoom", urlPatterns = "/AllRoom")
public class RoomServlet extends HttpServlet {
    private RoomService roomService = new RoomService();
    private TypeService typeService = new TypeService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int typeid=0;
        if(req.getParameter("typeid")!=null)
        {
            typeid=Integer.parseInt(req.getParameter("typeid"));
        }
        int count1 = roomService.GetAllCount();
        int count2 = roomService.getAllOrderCount();
        int count3 = roomService.getAllRepairCount();
        int count4 = roomService.getAllOccupiedCount();
        req.setAttribute("count1",count1);
        req.setAttribute("count2",count2);
        req.setAttribute("count3",count3);
        req.setAttribute("count4",count4);
        if(typeid == 0){
            List<Room> roomList = roomService.GetAllRoom();
            req.setAttribute("roomList", roomList);
            req.getRequestDispatcher("AllRoom.jsp").forward(req, resp);
        }else {
            List<Room> roomList = roomService.GetTypeRoom(typeid);
            Type type = typeService.selectTypeNameByID(typeid);
            req.setAttribute("typename",type.getTypename());
            req.setAttribute("roomList", roomList);
            req.getRequestDispatcher("TypeRoom.jsp").forward(req, resp);
        }
    }
}
