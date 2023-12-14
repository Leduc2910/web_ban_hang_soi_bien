package controller;

import filter.SessionUser;
import model.Account;
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

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "home":
                showHomePage(req, resp);
                break;
            case "category":
                showProductCategory(req, resp);
                break;
        }
    }

    private void showProductCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<Product> productList = new ArrayList<>();
        for (Product p : productService.findAll()) {
            if (p.getCategory().getId() == id) {
                productList.add(p);
            }
        }
        req.setAttribute("idCategory", id);
        req.setAttribute("productCategory", productList);
        List<Category> categoryList = categoryService.findAll();
        req.setAttribute("listCategory", categoryList);
        Account account = SessionUser.getUserSession(req);
        req.setAttribute("account", account);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("home/productCategory.jsp");
        requestDispatcher.forward(req, resp);
    }


    private void showHomePage(HttpServletRequest req, HttpServletResponse resp) throws
            ServletException, IOException {
        List<Product> productList = productService.findAll();
        req.setAttribute("listProduct", productList);
        List<Category> categoryList = categoryService.findAll();
        req.setAttribute("listCategory", categoryList);
        Account account = SessionUser.getUserSession(req);
        req.setAttribute("account", account);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("home/index.jsp");
        requestDispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
