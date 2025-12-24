package Service;

import Dao.OrderDao;
import Model.Admin;
import Model.Order;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class AdminOrderControlService {
    OrderDao orderDao = new OrderDao();
    public List<Order> GetAllOrders(){
        List<Order> orderList = null;
        try {
            orderList = orderDao.getAllOrder();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }
    public List<Order> GetAllOrdersByStates(String states){
        List<Order> orderList = null;
        try {
            orderList = orderDao.getAllOrderByStates(states);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }
    public void UpdateOrderStates(int updateorderid,String updatestates) throws SQLException {
        if(Objects.equals(updatestates, "approved")){
            try {
                orderDao.updateOrderStates(updateorderid,"通过");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else {
            try {
                orderDao.updateOrderStates(updateorderid,"拒绝");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
