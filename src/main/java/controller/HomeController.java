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

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();
    private OrderService orderService = new OrderService();
    private OrderItemService orderItemService = new OrderItemService();

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
        Account account = SessionUser.getUserSession(req);
        if (account != null) {
            Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
            List<OrderItem> orderItemList = orderItemService.getOrderItemWithOrderID(order.getId());
            int count = orderItemList.size();
            req.setAttribute("count", count);
        }
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
        req.setAttribute("account", account);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("home/productCategory.jsp");
        requestDispatcher.forward(req, resp);
    }


    private void showHomePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account account = SessionUser.getUserSession(req);
        int count = 0;
        if (account != null) {
            boolean result = orderService.checkOrder(account.getId());
            Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
            List<OrderItem> orderItemList = orderItemService.getOrderItemWithOrderID(order.getId());
            count = orderItemList.size();
        }
        List<Product> productList = productService.findAll();
        req.setAttribute("listProduct", productList);
        List<Category> categoryList = categoryService.findAll();
        req.setAttribute("listCategory", categoryList);
        req.setAttribute("account", account);
        req.setAttribute("count", count);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("home/index.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
