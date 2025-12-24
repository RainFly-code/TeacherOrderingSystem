package Servlet;

import Model.Order;
import Service.AdminOrderControlService;
import Service.AdminOrderSearchService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOrderSearchServlet", urlPatterns = "/AdminOrderSearchServlet")

public class AdminOrderSearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchuserid = req.getParameter("searchuserid");
        AdminOrderSearchService adminOrderSearchService = new AdminOrderSearchService();
        List<Order> searchorderList = adminOrderSearchService.GetAllOrderByUserId(searchuserid);
        req.setAttribute("AdminorderList",searchorderList);
        req.getRequestDispatcher("/AdminOrder.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
