package Dao;

import Model.User;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDao {
    public User selectById(int id) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from users where id=?";
        return r.query(sql, new BeanHandler<User>(User.class),id);
    }
    public User selectByIdPassword(int id,String password) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from users where userId=? and password=?";
        return r.query(sql, new BeanHandler<User>(User.class),id,password);
    }

}
