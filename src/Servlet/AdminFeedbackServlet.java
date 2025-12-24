package Servlet;

import Model.Feedback;
import Service.FeedbackService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "AdminFeedbackServlet", urlPatterns = "/AdminFeedbackServlet")

public class AdminFeedbackServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FeedbackService feedbackService = new FeedbackService();
        List<Feedback> feedbackList = feedbackService.SelectAllFeedback();
        req.setAttribute("feedbackList",feedbackList);
        req.getRequestDispatcher("/AdminFeedback.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
