package model;

public class Account {
    private int id;
    private String phoneNumber;
    private String password;
    private int role;
    private String fullName;

    public Account(int id, String phoneNumber, String password, int role, String fullName) {
        this.id = id;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.fullName = fullName;
    }

    public Account(String phoneNumber, String password, int role, String fullName) {
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.fullName = fullName;
    }
    public Account(String phoneNumber, String password, String fullName) {
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.fullName = fullName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
