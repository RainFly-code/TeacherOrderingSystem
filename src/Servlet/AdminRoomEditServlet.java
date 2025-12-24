package Servlet;

import Dao.RoomDao;
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

@WebServlet(name = "AdminRoomEditServlet", urlPatterns = "/AdminRoomEditServlet")

public class AdminRoomEditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int updateroomid = Integer.parseInt(req.getParameter("updateroomid"));
        AdminRoomService adminRoomService = new AdminRoomService();
        Room nowRoom = adminRoomService.SelectRoomByRoomId(updateroomid);
        String jsonRoom = "{" +
                "\"roomid\":\"" + nowRoom.getRoomid() + "\"," +
                "\"bnumber\":\"" + nowRoom.getBnumber() + "\"," +
                "\"fnumber\":\"" + nowRoom.getFnumber() + "\"," +
                "\"state\":\"" + nowRoom.getState() + "\"," +
                "\"typename\":\"" + nowRoom.getTypename() + "\"" +
                "}";
        req.setAttribute("nowUser",nowRoom);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        // 将 JSON 字符串写入响应
        resp.getWriter().write(jsonRoom);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
