package service;

import model.Order;
import service.IService.IOrderService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderService implements IOrderService<Order> {
    Connection connection = ConnectToMySQL.getConnection();
    @Override
    public void add(Order order) {
        String sql = "insert into `order`(idUser, totalPrice, status) values (?, ?, ?);";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, order.getIdUser());
            preparedStatement.setDouble(2,order.getTotalPrice());
            preparedStatement.setInt(3, order.getStatusCart());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(int id, Order order) {
        String sql = "update `order` set idUser = ?, totalPrice = ?, status = ? where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(4, id);
            preparedStatement.setInt(1, order.getIdUser());
            preparedStatement.setDouble(2, order.getTotalPrice());
            preparedStatement.setInt(3, order.getStatusCart());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "delete from `order` where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Order> findAll() {
        List<Order> orderList = new ArrayList<>();
        String sql = "select o.* from `order` o join user u on o.idUser = u.id;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int idUser = resultSet.getInt("idUser");
                double totalPrice = resultSet.getDouble("totalPrice");
                int statusCart = resultSet.getInt("statusCart");
                Order order = new Order(id, idUser, totalPrice, statusCart);
                orderList.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return orderList;
    }
}
