package Dao;

import Model.Feedback;
import Model.Room;
import Model.User;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class FeedbackDao {
    public void insertFeedback(Feedback feedback) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "INSERT INTO feedback (userid,content) VALUES (?, ?)";
        runner.update(sql,feedback.getUserid(),feedback.getContent());
    }
    public List<Feedback> selectAllFeedback() throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from feedback";
        return r.query(sql, new BeanListHandler< Feedback >(Feedback.class));
    }
    public void deleteFeedback(int feedbackid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "DELETE FROM feedback WHERE feedbackid = ?";
        runner.update(sql, feedbackid);
    }
    public List<Feedback> getAllFeedbackByUserId(String keyword) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from feedback where cast(userid as char) like ? ";
        return r.query(sql, new BeanListHandler<Feedback>(Feedback.class),"%"+keyword+"%");
    }
}
