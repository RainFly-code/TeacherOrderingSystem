package Dao;

import Model.Order;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

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
}
