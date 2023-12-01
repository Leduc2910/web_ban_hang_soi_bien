package service;

import model.Category;
import model.Product;
import service.IService.IProductService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService<Product> {
    private Connection connection = ConnectToMySQL.getConnection();

    @Override
    public void add(Product product) {
    String sql = "insert into product(name, brand, unit, weight, price, description, image, idcategory) values (?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getBrand());
            preparedStatement.setString(3, product.getUnit());
            preparedStatement.setDouble(4, product.getWeight());
            preparedStatement.setInt(5, product.getPrice());
            preparedStatement.setString(6, product.getDescription());
            preparedStatement.setString(7, product.getImage());
            preparedStatement.setInt(8, product.getCategory().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void edit(int id, Product product) {
    String sql = "update  product set name = ?, brand = ?, unit = ?, weight = ?, price = ?, description = ?, image = ?, idCategory = ? where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(9, id);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getBrand());
            preparedStatement.setString(3, product.getUnit());
            preparedStatement.setDouble(4, product.getWeight());
            preparedStatement.setInt(5, product.getPrice());
            preparedStatement.setString(6, product.getDescription());
            preparedStatement.setString(7, product.getImage());
            preparedStatement.setInt(8, product.getCategory().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
    String sql = "delete from product where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        String sql = "select product.*, c.name as nameCategory from product join category c on c.id = product.idCategory;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String brand = resultSet.getString("brand");
                String unit = resultSet.getString("unit");
                int weight = resultSet.getInt("weight");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String image = resultSet.getString("image");
                int idCategory = resultSet.getInt("idCategory");
                String nameCategory = resultSet.getString("nameCategory");
                Category category = new Category(idCategory, nameCategory);
                Product product = new Product(id, name, brand, unit, weight, price, description, image, category);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
}
