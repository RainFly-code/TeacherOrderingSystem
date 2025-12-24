package Service;

import Dao.RoomDao;
import Model.Room;
import Model.User;

import java.sql.SQLException;
import java.util.List;

public class AdminRoomService {
    RoomDao roomDao = new RoomDao();
    public List<Room> SelectAllRoom(){
        List<Room> AdminRoomList = null;
        try {
            AdminRoomList = roomDao.getAllRoom();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return AdminRoomList;
    }
    public Room SelectRoomByRoomId(int roomid){
        Room nowroom = null;
        try {
            nowroom = roomDao.selectById(roomid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nowroom;
    }
    public void updateRoom(Room room) throws SQLException {
        try {
            roomDao.updateRoom(room);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteRoom(int roomId) throws SQLException {
        try {
            roomDao.deleteRoom(roomId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void insertRoom(Room room) throws SQLException {
        try {
            roomDao.insertRoom(room);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Room> getAllRoomsByRoomId(String roomId) {
        try {
            return roomDao.selectAllRoomsByRoomId(roomId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
