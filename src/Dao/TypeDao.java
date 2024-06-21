package Dao;

import Model.Type;
import Util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class TypeDao
{
    public List<Type> GetAllType() throws SQLException {
        QueryRunner r=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from type";
        return r.query(sql,new BeanListHandler<Type>(Type.class));
    }
    public Type selectTypeNameByID(int typeid) throws SQLException {
        QueryRunner r=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from type where typeid=?";
        return r.query(sql,new BeanHandler<Type>(Type.class),typeid);
    }
    public Type select(int id) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from type where typeid = ?";
        return r.query(sql, new BeanHandler<Type>(Type.class),id);
    }
    public void insert(Type t) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into type(typename) values(?)";
        r.update(sql,t.getTypename());
    }
    public void update(Type t) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update type set typename=? where typeid = ?";
        r.update(sql,t.getTypename(),t.getTypeid());
    }
    public void delete(int id) throws SQLException {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from type where typeid = ?";
        r.update(sql,id);
    }
}
