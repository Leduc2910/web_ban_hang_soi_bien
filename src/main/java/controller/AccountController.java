package controller;

import service.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AccountController", value = "/account")

public class AccountController extends HttpServlet {
    private AccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "login":
                showFormLogin(req, resp);
                break;
            case "logout":
                logoutAccount(req, resp);
                break;
            case "showAllAccount":
                showAllAccount(req, resp);
                break;
            case "editAccount":
                showFormEdit(req, resp);
                break;
        }
    }

    private void logoutAccount(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showFormLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("account/login.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showAllAccount(HttpServletRequest req, HttpServletResponse resp) {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "login":
                checkLogin(req, resp);
                break;
            case "editAccount":
                editAccount(req, resp);
                break;
        }
    }

    private void checkLogin(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void editAccount(HttpServletRequest req, HttpServletResponse resp) {
    }
}
