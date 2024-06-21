package Model;

public class Admin {
    private int adminId;
    private String password;

    public Admin(int adminId, String password) {
        this.adminId = adminId;
        this.password = password;
    }

    public Admin() {
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
