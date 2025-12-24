package Servlet;

import Service.AdminOrderControlService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminOrderUpdateServlet", urlPatterns = "/AdminOrderUpdateServlet")

public class AdminOrderUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int updateorderid = Integer.parseInt(req.getParameter("updateorderid"));
        String updatestates = req.getParameter("updatestates");
        AdminOrderControlService adminOrderControlService = new AdminOrderControlService();
        try {
            adminOrderControlService.UpdateOrderStates(updateorderid,updatestates);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("AdminOrderControlServlet").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
