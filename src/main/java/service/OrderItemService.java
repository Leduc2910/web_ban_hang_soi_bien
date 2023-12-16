package service;

import model.OrderItem;
import service.IService.IOrderItemService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderItemService implements IOrderItemService<OrderItem> {
    Connection connection = ConnectToMySQL.getConnection();

    public OrderItem getOrderItemWithOrderAndProduct(int idOrder, int idProduct) {
        String sql = "select * from `orderitem` where idOrder = " + idOrder + " and idProduct = " + idProduct;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int quantity = resultSet.getInt("quantity");
                double totalPrice = resultSet.getDouble("totalPrice");
                OrderItem orderItem = new OrderItem(id, idOrder, idProduct, quantity, totalPrice);
                return orderItem;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void add(OrderItem orderItem) {
        String sql = "insert into orderitem(idOrder, idProduct, quantity, totalPrice) values (?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, orderItem.getIdOrder());
            preparedStatement.setInt(2, orderItem.getIdProduct());
            preparedStatement.setInt(3, orderItem.getQuantity());
            preparedStatement.setDouble(4, orderItem.getTotalPrice());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public void edit(int id, OrderItem orderItem) {
        String sql = "update orderitem set idOrder = ?, idProduct = ?, quantity= ?, totalPrice =? where id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, orderItem.getIdOrder());
            preparedStatement.setInt(2, orderItem.getIdProduct());
            preparedStatement.setInt(3, orderItem.getQuantity());
            preparedStatement.setDouble(4, orderItem.getTotalPrice());
            preparedStatement.setInt(5, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void delete(int id) {
        String sql = "delete from orderitem where id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<OrderItem> findAll() {
        String sql = "select * from orderitem";
        List<OrderItem> orderItemList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int idOrder = resultSet.getInt("idOrder");
                int idProduct = resultSet.getInt("idProduct");
                int quantity = resultSet.getInt("quantity");
                double totalPrice = resultSet.getDouble("totalPrice");
                OrderItem orderItem = new OrderItem(id, idOrder, idProduct, quantity, totalPrice);
                orderItemList.add(orderItem);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return orderItemList;
    }

    public List<OrderItem> getOrderItemWithOrderID(int idOrder) {
        String sql = "select * from orderitem where idOrder = " + idOrder;
        List<OrderItem> orderItemList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int idProduct = resultSet.getInt("idProduct");
                int quantity = resultSet.getInt("quantity");
                double totalPrice = resultSet.getDouble("totalPrice");
                OrderItem orderItem = new OrderItem(id, idOrder, idProduct, quantity, totalPrice);
                orderItemList.add(orderItem);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return orderItemList;
    }
}