package Service;

import Dao.RoomDao;
import Model.Room;
import Model.Type;

import java.sql.SQLException;
import java.util.List;

public class RoomService {
    RoomDao roomDao = new RoomDao();
    public List<Room> GetAllRoom(){
        List<Room> list=null;
        try {
            list=roomDao.getAllRoom();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public int GetAllCount(){
        int count = 0;
        try {
            count=roomDao.getAllCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    public int getAllOrderCount(){
        int count = 0;
        try {
            count=roomDao.getAllOrderCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    public int getAllRepairCount(){
        int count = 0;
        try {
            count=roomDao.getAllRepairCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    public int getAllOccupiedCount(){
        int count = 0;
        try {
            count=roomDao.getAllOccupiedCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    //获取某种类型的房间信息
    public List<Room> GetTypeRoom(int typeid){
        List<Room> list=null;
        try {
            list=roomDao.getTypeRoom(typeid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
