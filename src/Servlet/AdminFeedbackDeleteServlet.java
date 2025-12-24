package Servlet;

import Service.AdminUserService;
import Service.FeedbackService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminFeedbackDeleteServlet", urlPatterns = "/AdminFeedbackDeleteServlet")

public class AdminFeedbackDeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int feedbackid = Integer.parseInt(req.getParameter("feedbackid"));
        FeedbackService feedbackService = new FeedbackService();
        try {
            feedbackService.DeleteFeedback(feedbackid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
