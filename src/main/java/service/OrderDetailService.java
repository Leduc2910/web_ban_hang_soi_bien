package service;

import model.OrderDetail;
import service.IService.IOrderDetailService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailService implements IOrderDetailService<OrderDetail> {
    private Connection connection = ConnectToMySQL.getConnection();

    @Override
    public void add(OrderDetail orderDetail) {
        String sql = "insert into orderdetail(idOrder, fullName, phoneNumber, address, totalPrice, status) values (?,?,?,?,?,?);";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, orderDetail.getIdOrder());
            preparedStatement.setString(2, orderDetail.getFullName());
            preparedStatement.setString(3, orderDetail.getPhoneNumber());
            preparedStatement.setString(4, orderDetail.getAddress());
            preparedStatement.setDouble(5, orderDetail.getTotalPrice());
            preparedStatement.setInt(6, orderDetail.getStatusOrder());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(int id, OrderDetail orderDetail) {
        String sql = "update orderdetail set fullName = ? , phoneNumber = ?, address = ?, totalPrice = ?, status = ? where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, orderDetail.getFullName());
            preparedStatement.setString(2, orderDetail.getPhoneNumber());
            preparedStatement.setString(3, orderDetail.getAddress());
            preparedStatement.setDouble(4, orderDetail.getTotalPrice());
            preparedStatement.setInt(5, orderDetail.getStatusOrder());
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "delete from orderdetail where id = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<OrderDetail> findAll() {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "select orderdetail.* from orderdetail order by orderdetail.id;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int idOrder = resultSet.getInt("idOrder");
                String fullName = resultSet.getString("fullName");
                String phoneNumber = resultSet.getString("phoneNumber");
                String address = resultSet.getString("address");
                double totalPrice = resultSet.getDouble("totalPrice");
                int statusOrder = resultSet.getInt("status");
                OrderDetail orderDetail = new OrderDetail(id, fullName, phoneNumber, address, totalPrice, statusOrder, idOrder);
                orderDetails.add(orderDetail);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderDetails;
    }
}
