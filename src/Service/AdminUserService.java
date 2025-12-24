package Service;

import Dao.AdminDao;
import Dao.UserDao;
import Model.Admin;
import Model.Order;
import Model.User;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;
import java.util.List;

public class AdminUserService {
    UserDao userDao = new UserDao();
    public List<User> SelectAllUser(){
        List<User> AdminUserList = null;
        try {
            AdminUserList = userDao.selectAllUser();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return AdminUserList;
    }
    public User SelectAllUserByuserId(int userId){
        User nowuser = null;
        try {
            nowuser = userDao.selectById(userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nowuser;
    }
    public void UpdateUser(User user) throws SQLException {
        try {
             userDao.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void InsertUser(User user) throws SQLException {
        try {
            userDao.insertUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    AdminDao adminDao = new AdminDao();
    //插入管理员
    public void InsertAdmin(Admin admin) throws SQLException {
        try {
            adminDao.insertAdmin(admin);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void DeleteUser(int userid) throws SQLException {
        try {
            userDao.deleteUser(userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<User> GetAllUserByUserId(String keyword){
        List<User> searchuserList = null;
        try {
            searchuserList = userDao.getAllUserByUserId(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchuserList;
    }
}
