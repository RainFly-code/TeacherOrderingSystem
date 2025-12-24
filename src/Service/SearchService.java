package Service;

import Dao.RoomDao;
import Model.Room;

import javax.swing.tree.RowMapper;
import java.sql.SQLException;
import java.util.List;

public class SearchService {
    RoomDao roomDao = new RoomDao();
    public List<Room> getAllSearchRoom(String keyword){
        List<Room> list = null;
        try {
            list=roomDao.GetSearchRooms(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
