package Service;

import Dao.UserDao;
import Model.User;

import java.sql.SQLException;

public class UserService {
    private UserDao userDao = new UserDao();
    public User login(int id , String password) {
        User user = null;
        try {
            user = userDao.selectByIdPassword(id, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
