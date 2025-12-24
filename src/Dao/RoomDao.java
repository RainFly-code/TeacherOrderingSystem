package Dao;

import Model.Occupied;
import Model.Room;
import Service.TypeService;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

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
    public List<Room> getTypeRoom(String typename) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        TypeService typeService = new TypeService();
        //先根据id获取对应类型名
        String sql="select * from room where typename = ? ";
        return r.query(sql, new BeanListHandler<Room>(Room.class),typename);
    }
    //搜索查询房间
    public List<Room> GetSearchRooms(String keyword) throws SQLException{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from room where cast(roomId as char) like ? ";
        return r.query(sql, new BeanListHandler<Room>(Room.class),"%"+keyword+"%");
    }
    public List<Occupied> getOccupiedCountByFloor() throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT bnumber, COUNT(*) as count FROM room WHERE state = '已入住' GROUP BY bnumber";
        return r.query(sql,  new BeanListHandler<Occupied>(Occupied.class));
    }
    public Room selectById(int roomid) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from room where roomId=?";
        return r.query(sql, new BeanHandler<Room>(Room.class),roomid);
    }
    public void updateRoom(Room room) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "UPDATE room SET bnumber = ?, fnumber = ?, state = ?, typename = ? WHERE roomId = ?";
        runner.update(sql, room.getBnumber(), room.getFnumber(), room.getState(), room.getTypename(), room.getRoomid());
    }
    public void deleteRoom(int roomId) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "DELETE FROM room WHERE roomId = ?";
        runner.update(sql, roomId);
    }
    public void insertRoom(Room room) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "INSERT INTO room (roomId, bnumber, fnumber, state, typename) VALUES (?, ?, ?, ?, ?)";
        runner.update(sql, room.getRoomid(), room.getBnumber(), room.getFnumber(), room.getState(), room.getTypename());
    }
    public List<Room> selectAllRoomsByRoomId(String roomId) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from room where cast(roomId as char) like ? ";
        return runner.query(sql, new BeanListHandler<>(Room.class), "%" + roomId + "%");
    }
}
