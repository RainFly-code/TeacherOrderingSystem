package Dao;

import Model.Admin;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class AdminDao {
    public Admin selectByIdPassword(int adminId, String password) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from admin where adminId=? and password=?";
        return r.query(sql, new BeanHandler<Admin>(Admin.class),adminId,password);
    }

}
