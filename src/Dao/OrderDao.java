package Dao;

import Model.Order;
import Model.OrderChart;
import Model.Room;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class OrderDao {
    public void insertOrder(Connection con, Order order) throws SQLException {
        QueryRunner r = new QueryRunner();
        String sql = "insert into orders(userId,roomId,nowtime,starttime,endtime,approvalstate) values(?,?,?,?,?,?)";
        r.update(con,sql, order.getUserId(),order.getRoomId(),order.getNowtime(), order.getStarttime(),order.getEndtime(),order.getApprovalstate());
    }
    public List<Order> getAllOrder() throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from orders";
        return r.query(sql, new BeanListHandler<Order>(Order.class));
    }
    public void cancelOrder(int orderid) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from orders where orderId = ?";
        r.update(sql,orderid);
    }
    public List<OrderChart> selectDate() throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT DATE(nowtime) AS order_date, COUNT(*) AS order_count FROM orders WHERE nowtime >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) GROUP BY DATE(nowtime) ORDER BY order_date asc";
        return r.query(sql,new BeanListHandler<OrderChart>(OrderChart.class));
    }
    public List<Order> getAllOrderByStates(String states) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from orders where approvalstate = ?";
        return r.query(sql, new BeanListHandler<Order>(Order.class),states);
    }
    public List<Order> getAllOrderByUserId(String keyword) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from orders where cast(userId as char) like ? ";
        return r.query(sql, new BeanListHandler<Order>(Order.class),"%"+keyword+"%");
    }
    public List<Order> getOrderByUserId(int keyword) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from orders where userId = ? ";
        return r.query(sql, new BeanListHandler<Order>(Order.class),keyword);
    }
    //更新订单状态
    public void updateOrderStates(int orderId, String status) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "UPDATE orders SET approvalstate = ? WHERE orderId = ?";
        r.update(sql, status, orderId);
    }

}
