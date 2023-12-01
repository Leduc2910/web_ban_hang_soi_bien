package controller;

import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ManagerController", value = "/admin")
public class ManagerController extends HttpServlet {
    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "home":
                showMenuManager(req, resp);
                break;
            case "managerCategory":
                showAllCategory(req, resp);
                break;
            case "managerProduct":
                showAllProduct(req, resp);
                break;
            case "addProduct":
                showFormAddProduct(req, resp);
                break;
            case "addCategory":
                showFormAddCategory(req, resp);
                break;
        }
    }

    private void showFormAddCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/addCategory.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showFormAddProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("listCategory", categories);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/addProduct.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showAllProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.findAll();
        req.setAttribute("listProduct", products);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/managerProduct.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showAllCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("listCategory", categories);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/managerCategory.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showMenuManager(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/index.jsp");
        requestDispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "home":
                showMenuManager(req, resp);
                break;
            case "addProduct":
                addProduct(req, resp);
                break;
            case "addCategory":
                addCategory(req, resp);
                break;
        }

    }

    private void addCategory(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void addProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String brand = req.getParameter("brand");
        String unit = req.getParameter("unit");
        double weight = Double.parseDouble(req.getParameter("weight"));
        int price = Integer.parseInt(req.getParameter("price"));
        String description = req.getParameter("description");
        String image = req.getParameter("image");
        int idCategory = Integer.parseInt(req.getParameter("idCategory"));
        Category category = new Category(idCategory);
        Product product = new Product(name, brand, unit, weight, price, description, image, category);
        productService.add(product);
        resp.sendRedirect("/admin?action=managerProduct");
    }
}
