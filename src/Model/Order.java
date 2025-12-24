package Model;

import java.util.Date;

public class Order {
    private int orderId;
    private int userId;
    private int roomId;
    private String nowtime;
    private String starttime;
    private String endtime;
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

    public String getNowtime() {
        return nowtime;
    }

    public void setNowtime(String nowtime) {
        this.nowtime = nowtime;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
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

    public Order(int orderId, int userId, int roomId, String nowtime, String starttime, String endtime, String approvalstate) {
        this.orderId = orderId;
        this.userId = userId;
        this.roomId = roomId;
        this.nowtime = nowtime;
        this.starttime = starttime;
        this.endtime = endtime;
        this.approvalstate = approvalstate;
    }
}
