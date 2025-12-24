package Service;

import Dao.OrderDao;
import Model.Order;
import Model.Room;

import java.sql.SQLException;
import java.util.List;

public class AllOrderService {
                OrderDao orderDao = new OrderDao();
                public List<Order> GetOrderById(int userid){
                    List<Order> list=null;
                    try {
                        list=orderDao.getOrderByUserId(userid);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
        return list;
    }
}
