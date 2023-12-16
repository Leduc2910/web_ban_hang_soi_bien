package controller;

import filter.SessionUser;
import model.*;
import service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();

    private OrderService orderService = new OrderService();
    private OrderDetailService orderDetailService = new OrderDetailService();
    private OrderItemService orderItemService = new OrderItemService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "cart":
                showFormCart(req, resp);
                break;
        }
    }

    private void showFormCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account account = SessionUser.getUserSession(req);
        if (account == null) {
            resp.sendRedirect("account?action=login");
        } else {
            List<Category> categoryList = categoryService.findAll();
            boolean result = orderService.checkOrder(account.getId());
            Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
            List<OrderItem> orderItemList = orderItemService.getOrderItemWithOrderID(order.getId());
            List<Product> productList = new ArrayList<>();
            int totalPrice = 0;
            if (orderItemList.size() != 0) {
                for (OrderItem orderItem : orderItemList) {
                    totalPrice += orderItem.getTotalPrice();
                    order.setTotalPrice(totalPrice);
                    orderService.edit(order.getId(), order);
                    productList.add(productService.getProductWithID(orderItem.getIdProduct()));
                }

            } else {
                order.setTotalPrice(totalPrice);
                orderService.edit(order.getId(), order);
            }
            req.setAttribute("listCategory", categoryList);
            req.setAttribute("account", account);
            req.setAttribute("lstProduct", productList);
            req.setAttribute("lstOrderItem", orderItemList);
            req.setAttribute("order", order);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("order/productCart.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "addToCart":
                addToCart(req, resp);
                break;
            case "deleteAllOrderItem":
                deleteAllOrderItem(req, resp);
                break;
            case "deleteOrderItem":
                deleteOrderItem(req, resp);
                break;
            case "editQuantityItem":
                editQuantityItem(req, resp);
                break;
        }
    }

    private void editQuantityItem(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void deleteOrderItem(HttpServletRequest req, HttpServletResponse resp) {
        Account account = SessionUser.getUserSession(req);
        Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
        int idProduct = Integer.parseInt(req.getParameter("id"));
        OrderItem orderItem = orderItemService.getOrderItemWithOrderAndProduct(order.getId(), idProduct);
        orderItemService.delete(orderItem.getId());
        try {
            resp.sendRedirect("/order?action=cart");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteAllOrderItem(HttpServletRequest req, HttpServletResponse resp) {
        Account account = SessionUser.getUserSession(req);
        Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
        List<OrderItem> orderItemList = orderItemService.getOrderItemWithOrderID(order.getId());
        for (OrderItem orderItem : orderItemList) {
            orderItemService.delete(orderItem.getId());
        }
        try {
            resp.sendRedirect("/order?action=cart");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Account account = SessionUser.getUserSession(req);
        if (account == null) {
            resp.sendRedirect("/account?action=login");
        } else {
            int productID = Integer.parseInt(req.getParameter("id"));
            boolean result = orderService.checkOrder(account.getId());
            Order order = orderService.getOrderUserOnStatus(account.getId(), 1);
            OrderItem orderItem = orderItemService.getOrderItemWithOrderAndProduct(order.getId(), productID);
            if (orderItem != null) {
                int quantity = orderItem.getQuantity();
                ++quantity;
                double totalPrice = quantity * productService.getProductWithID(productID).getPrice();
                OrderItem orderItem1 = new OrderItem(order.getId(), productID, quantity, totalPrice);
                orderItemService.edit(orderItem.getId(), orderItem1);
            } else {
                int quantity = 1;
                double totalPrice = productService.getProductWithID(productID).getPrice();
                OrderItem orderItem1 = new OrderItem(order.getId(), productID, quantity, totalPrice);
                orderItemService.add(orderItem1);
            }
            resp.sendRedirect("/order?action=cart");
        }
    }
}

