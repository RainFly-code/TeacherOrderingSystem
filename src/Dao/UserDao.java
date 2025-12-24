package Dao;

import Model.Order;
import Model.Room;
import Model.User;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDao {
    public User selectById(int userid) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from users where userid=?";
        return r.query(sql, new BeanHandler<User>(User.class),userid);
    }
    public User selectByIdPassword(int id,String password) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from users where userId=? and password=?";
        return r.query(sql, new BeanHandler<User>(User.class),id,password);
    }
    public List<User> selectAllUser() throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from users";
        return r.query(sql, new BeanListHandler< User >(User.class));
    }
    public void updateUser(User user) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "UPDATE users SET name = ?, password = ?, department = ?, pnumber = ? WHERE userid = ?";
        Object[] params = { user.getName(), user.getPassword(), user.getDepartment(), user.getPnumber(), user.getUserid() };
        runner.update(sql, params);
    }
    public void insertUser(User user) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "INSERT INTO users (userid, name, password, department, pnumber) VALUES (?, ?, ?, ?, ?)";
        Object[] params = { user.getUserid(), user.getName(), user.getPassword(), user.getDepartment(), user.getPnumber() };
        runner.update(sql, params);
    }
    public void deleteUser(int userId) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "DELETE FROM users WHERE userid = ?";
        runner.update(sql, userId);
    }
    public List<User> getAllUserByUserId(String keyword) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from users where cast(userId as char) like ? ";
        return r.query(sql, new BeanListHandler<User>(User.class),"%"+keyword+"%");
    }
}
