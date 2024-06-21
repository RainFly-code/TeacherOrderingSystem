package Service;

import Dao.OrderDao;
import Model.Order;
import Util.DataSourceUtils;

import java.sql.Connection;
import java.sql.SQLException;

public class OrderService {
    OrderDao orderDao = new OrderDao();
    public void addOrder(Order order) {
        Connection con = null;
        try {
            con = DataSourceUtils.getConnection();
            con.setAutoCommit(false);
            orderDao.insertOrder(con, order);
            con.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            if(con!=null)
                try {
                    con.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
        }
    }
}
