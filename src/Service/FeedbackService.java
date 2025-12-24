package Service;

import Dao.FeedbackDao;
import Model.Feedback;
import Model.Room;
import Model.User;

import java.sql.SQLException;
import java.util.List;

public class FeedbackService {
    FeedbackDao feedbackDao = new FeedbackDao();
    public void insertFeedback(Feedback feedback) throws SQLException {
        try {
            feedbackDao.insertFeedback(feedback);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Feedback> SelectAllFeedback(){
        List<Feedback> FeedbackList = null;
        try {
            FeedbackList = feedbackDao.selectAllFeedback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return FeedbackList;
    }
    public void DeleteFeedback(int feedbackid) throws SQLException {
        try {
            feedbackDao.deleteFeedback(feedbackid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Feedback> GetAllFeedback(String keyword){
        List<Feedback> searchuserList = null;
        try {
            searchuserList = feedbackDao.getAllFeedbackByUserId(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchuserList;
    }
}
