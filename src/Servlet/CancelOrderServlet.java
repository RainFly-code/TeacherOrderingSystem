package Servlet;

import Service.CancelOrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CancelOrderServlet", urlPatterns = "/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderid = Integer.parseInt(req.getParameter("orderid"));
        CancelOrderService cancelOrderService = new CancelOrderService();
        try {
            cancelOrderService.CancelOrder(orderid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("cancelSuccess",true);
        req.getRequestDispatcher("AllOrderServlet").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
