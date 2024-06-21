package Service;

import Dao.AdminDao;
import Model.Admin;

import java.sql.SQLException;

public class AdminService {
    private AdminDao adminDao = new AdminDao();
    public Admin login(int AdminId , String password) {
        Admin admin = null;
        try {
            admin = adminDao.selectByIdPassword(AdminId, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}
