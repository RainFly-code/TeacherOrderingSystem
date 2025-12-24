package Servlet;

import Model.Admin;
import Model.Order;
import Service.AdminOrderControlService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "AdminOrderControlServlet", urlPatterns = "/AdminOrderControlServlet")

public class AdminOrderControlServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String states = req.getParameter("states");
        AdminOrderControlService adminOrderControlService = new AdminOrderControlService();
        List<Order> AdminorderList = null;
        if(Objects.equals(states, "all") || states == null){
            AdminorderList = adminOrderControlService.GetAllOrders();
        }else {
            AdminorderList = adminOrderControlService.GetAllOrdersByStates(states);
        }
        req.setAttribute("AdminorderList",AdminorderList);
        req.getRequestDispatcher("/AdminOrder.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
