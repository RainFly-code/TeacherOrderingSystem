package Service;

import Dao.OrderDao;
import Dao.RoomDao;
import Model.Occupied;
import Model.Order;
import Model.OrderChart;
import Model.Room;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ChartService {
    OrderDao orderDao = new OrderDao();

    public List<String> SelectDate() throws SQLException {
        List<OrderChart> list = orderDao.selectDate();
        List<String> datelist = new ArrayList<>();

        if(list.size() < 7){
            for (int i = 1 ; i <= 7 - list.size() ; i++){
                datelist.add(null);
            }
            for (int i = 0 ; i < list.size() ; i++){
                datelist.add(list.get(i).getOrder_date());
            }
        }
        return datelist;
    }
    public List<Integer> SelectCount() throws SQLException {
        List<OrderChart> list = orderDao.selectDate();
        List<Integer> numberlist = new ArrayList<>();
        if(list.size() < 7){
            for (int i = 1 ; i <= 7 - list.size() ; i++){
                numberlist.add(0);
            }
        }
        for (int i = 0 ; i < list.size() ; i++){
            numberlist.add(list.get(i).getOrder_count());
        }
        return numberlist;
    }
    public List<Integer> SelectDistriRoom() throws SQLException {
        RoomDao roomDao = new RoomDao();
        List<Occupied> occupiedlist = roomDao.getOccupiedCountByFloor();
        List<Integer> distriRoomlist = new ArrayList<>();
        for (int i = 1 ; i <= 7; i++){
            distriRoomlist.add(0);
        }
        for (int i = 0 ; i < occupiedlist.size() ; i++){
            distriRoomlist.set(occupiedlist.get(i).getBnumber(),occupiedlist.get(i).getCount());
        }
        return distriRoomlist;
    }
}
