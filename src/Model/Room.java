package Model;

public class Room {
    private int roomid;     //房间id
    private int bnumber;    //楼号
    private int fnumber;    //楼层
    private String state;   //房间状态
    private String typename;    //房间类型

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Room() {
    }

    public Room(int roomid, int bnumber, int fnumber, String state) {
        this.roomid = roomid;
        this.bnumber = bnumber;
        this.fnumber = fnumber;
        this.state = state;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getBnumber() {
        return bnumber;
    }

    public void setBnumber(int bnumber) {
        this.bnumber = bnumber;
    }

    public int getFnumber() {
        return fnumber;
    }

    public void setFnumber(int fnumber) {
        this.fnumber = fnumber;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
