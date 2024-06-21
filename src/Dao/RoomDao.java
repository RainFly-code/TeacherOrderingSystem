package Dao;

import Model.Room;
import Model.Type;
import Service.TypeService;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class RoomDao {
    //获取全部房间信息
    public List<Room> getAllRoom() throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from room";
        return r.query(sql, new BeanListHandler<Room>(Room.class));
    }
    //获取房间总数量
    public int getAllCount() throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT COUNT(*) FROM room";
        return r.query(sql, new ScalarHandler<Long>()).intValue();
    }
    public int getAllOrderCount() throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT COUNT(*) FROM room where state = '可预订'";
        return r.query(sql, new ScalarHandler<Long>()).intValue();
    }
    public int getAllRepairCount() throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT COUNT(*) FROM room where state = '维修中'";
        return r.query(sql, new ScalarHandler<Long>()).intValue();
    }
    public int getAllOccupiedCount() throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT COUNT(*) FROM room where state = '已入住'";
        return r.query(sql, new ScalarHandler<Long>()).intValue();
    }
    //更新房间状态
    public void updateRoomState(int roomid,String states) throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "UPDATE room SET state = ? WHERE roomid = ?";
        r.update(sql, states,roomid);
    }
    //根据房间类型查询房间信息
    public List<Room> getTypeRoom(int typeid) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        TypeService typeService = new TypeService();
        //先根据id获取对应类型名
        Type type = typeService.selectTypeNameByID(typeid);
        String sql="select * from room where typename = ? ";
        return r.query(sql, new BeanListHandler<Room>(Room.class),type.getTypename());
    }
}
