package Service;

import Dao.TypeDao;

import java.sql.SQLException;
import java.util.List;

public class TypeService {
    TypeDao tDao=new TypeDao();
    public List<String> GetAllType()
    {
        List<String> list=null;
        try {
            list=tDao.GetAllType();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
