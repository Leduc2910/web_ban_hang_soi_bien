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

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "detail":
                showProductDetail(req, resp);
                break;
            case "category":
                showAllProductCategory(req, resp);
                break;
        }
    }

    private void showAllProductCategory(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showProductDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        for (Product p : productService.findAll()) {
            if (p.getId() == id) {
                req.setAttribute("product", p);
            }
        }
        List<Category> categoryList = categoryService.findAll();
        req.setAttribute("listCategory", categoryList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/productDetail.jsp");
        requestDispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
