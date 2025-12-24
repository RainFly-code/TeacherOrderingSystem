package Servlet;

import Dao.FeedbackDao;
import Model.Feedback;
import Model.User;
import Service.FeedbackService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "FeedbackServlet", urlPatterns = "/FeedbackServlet")

public class FeedbackServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String content = req.getParameter("feedback");
        int userid = Integer.parseInt(req.getParameter("userid"));
        Feedback feedback = new Feedback();
        feedback.setUserid(userid);
        feedback.setContent(content);
        FeedbackService feedbackService = new FeedbackService();
        try {
            feedbackService.insertFeedback(feedback);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
