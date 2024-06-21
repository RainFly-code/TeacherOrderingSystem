package Model;

import java.util.Objects;

public class User {
    private int userid;
    private String name;
    private String password;
    private String department;
    private String pnumber;

    public User() {
    }

    public int getUserid() {
        return userid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return userid == user.userid && Objects.equals(name, user.name) && Objects.equals(password, user.password) && Objects.equals(department, user.department) && Objects.equals(pnumber, user.pnumber);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userid, name, password, department, pnumber);
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPnumber() {
        return pnumber;
    }

    public void setPnumber(String pnumber) {
        this.pnumber = pnumber;
    }

    public User(int userid, String name, String password, String department, String pnumber) {
        this.userid = userid;
        this.name = name;
        this.password = password;
        this.department = department;
        this.pnumber = pnumber;
    }
}
