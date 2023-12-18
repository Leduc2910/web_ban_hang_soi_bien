package controller;

import filter.SessionUser;
import model.*;
import service.CategoryService;
import service.OrderItemService;
import service.OrderService;
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
    private OrderService orderService = new OrderService();
    private OrderItemService orderItemService = new OrderItemService();

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
            case "ascending":
                showAllProductCategoryByASC(req, resp);
                break;
            case "descending":
                showAllProductCategoryByDESC(req, resp);
                break;
        }
    }
    private void showAllProductCategoryByDESC(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account account = SessionUser.getUserSession(req);
        if (account != null) {
            Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
            List<OrderItem> orderItemList = orderItemService.getOrderItemWithOrderID(order.getId());
            int count = orderItemList.size();
            req.setAttribute("count", count);
        }
        int id = Integer.parseInt(req.getParameter("id"));
        for (Category c : categoryService.findAll()) {
            if (c.getId() == id) {
                req.setAttribute("category", c);
            }
        }
        List<Product> products = productService.findAllByDESC();
        req.setAttribute("listProduct", products);
        List<Category> categoryList = categoryService.findAll();
        req.setAttribute("listCategory", categoryList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/productCategory.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showAllProductCategoryByASC(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account account = SessionUser.getUserSession(req);
        if (account != null) {
            Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
            List<OrderItem> orderItemList = orderItemService.getOrderItemWithOrderID(order.getId());
            int count = orderItemList.size();
            req.setAttribute("count", count);
        }
        int id = Integer.parseInt(req.getParameter("id"));
        for (Category c : categoryService.findAll()) {
            if (c.getId() == id) {
                req.setAttribute("category", c);
            }
        }
        List<Product> products = productService.findAllByASC();
        req.setAttribute("listProduct", products);
        List<Category> categoryList = categoryService.findAll();
        req.setAttribute("listCategory", categoryList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/productCategory.jsp");
        requestDispatcher.forward(req, resp);

    }

    private void showAllProductCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account account = SessionUser.getUserSession(req);
        if (account != null) {
            Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
            List<OrderItem> orderItemList = orderItemService.getOrderItemWithOrderID(order.getId());
            int count = orderItemList.size();
            req.setAttribute("count", count);
        }
        int id = Integer.parseInt(req.getParameter("id"));
        for (Category c : categoryService.findAll()) {
            if (c.getId() == id) {
                req.setAttribute("category", c);
            }
        }
        List<Product> products = productService.findAll();
        req.setAttribute("listProduct", products);
        List<Category> categoryList = categoryService.findAll();
        req.setAttribute("listCategory", categoryList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/productCategory.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showProductDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account account = SessionUser.getUserSession(req);
        if (account != null) {
            Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
            List<OrderItem> orderItemList = orderItemService.getOrderItemWithOrderID(order.getId());
            int count = orderItemList.size();
            req.setAttribute("count", count);
        }
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
