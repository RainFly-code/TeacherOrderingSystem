package Servlet;

import Dao.OrderDao;
import Model.Order;
import Model.User;
import Service.OrderService;
import com.mysql.cj.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.awt.*;
import java.io.IOException;
import java.io.OptionalDataException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "OrderServlet", urlPatterns = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    private OrderService orderService = new OrderService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String starttime = req.getParameter("starttime");
        String endtime = req.getParameter("endtime");
        int roomid = Integer.parseInt(req.getParameter("roomid"));
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        int userid = user.getUserid();
        Order order = new Order();
        order.setUserId(userid);
        order.setRoomId(roomid);
        order.setNowtime(new Date());
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        /**
         * date类型转换
         */
        try {
            order.setStarttime(ft.parse(starttime));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        try {
            order.setEndtime(ft.parse(endtime));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        order.setApprovalstate("未审批");
        orderService.addOrder(order);
        req.getRequestDispatcher("AllRoom?roomid=0").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
