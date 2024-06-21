package Servlet;

import Model.Order;
import Model.User;
import Service.AllOrderService;
import com.mysql.cj.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllOrderServlet", urlPatterns = "/AllOrderServlet")
public class AllOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        int userid = user.getUserid();
        AllOrderService allOrderService = new AllOrderService();
        List<Order> orderList= allOrderService.GetAllOrder();
        req.setAttribute("orderlist", orderList);
        req.getRequestDispatcher("AllOrder.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
