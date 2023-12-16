package model;

public class Order {
    private int id;
    private int idUser;
    private double totalPrice;
    private int statusCart;

    public Order(int id, int idUser, double totalPrice, int statusCart) {
        this.id = id;
        this.idUser = idUser;
        this.totalPrice = totalPrice;
        this.statusCart = statusCart;
    }
    public Order( int idUser, double totalPrice, int statusCart) {
        this.idUser = idUser;
        this.totalPrice = totalPrice;
        this.statusCart = statusCart;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getStatusCart() {
        return statusCart;
    }

    public void setStatusCart(int statusCart) {
        this.statusCart = statusCart;
    }
}
