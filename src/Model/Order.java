package Model;

import java.util.Date;
import java.time.format.DateTimeFormatter;

public class Order {
    private int orderId;
    private int userId;
    private int roomId;
    private Date nowtime;
    private Date starttime;
    private Date endtime;
    String approvalstate;

    public int getRoomId() {
        return roomId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }


    public Date getNowtime() {
        return nowtime;
    }

    public void setNowtime(Date nowtime) {
        this.nowtime = nowtime;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getApprovalstate() {
        return approvalstate;
    }

    public void setApprovalstate(String approvalstate) {
        this.approvalstate = approvalstate;
    }

    public Order() {
    }

    public Order(int userId, int roomId, Date nowtime, Date starttime, Date endtime, String approvalstate) {
        this.userId = userId;
        this.roomId = roomId;
        this.nowtime = nowtime;
        this.starttime = starttime;
        this.endtime = endtime;
        this.approvalstate = approvalstate;
    }
}
