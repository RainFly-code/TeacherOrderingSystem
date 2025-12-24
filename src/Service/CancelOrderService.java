package Service;

import Dao.OrderDao;

import java.sql.SQLException;

public class CancelOrderService {
    OrderDao orderDao = new OrderDao();
    public void CancelOrder(int orderid) throws SQLException {
        orderDao.cancelOrder(orderid);
    }
}
