package Service;

import Dao.OrderDao;
import Model.Order;

import java.sql.SQLException;
import java.util.List;

public class AdminOrderSearchService {
    OrderDao orderDao = new OrderDao();
    public List<Order> GetAllOrderByUserId(String keyword){
        List<Order> searchorderList = null;
        try {
            searchorderList = orderDao.getAllOrderByUserId(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchorderList;
    }
}
