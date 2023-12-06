package controller;

import model.Account;
import service.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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

        }
    }
    private void logoutAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect("/account?action=login");
    }

    private void showFormLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("account/login.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "login":
                checkLogin(req, resp);
                break;
        }
    }


    private void checkLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String phoneNumber = req.getParameter("phoneNumber");
        String password = req.getParameter("password");
        String error = "";

        if (accountService.checkAccount(phoneNumber, password)) {
            Account account = accountService.getAccount(phoneNumber, password);
            HttpSession session = req.getSession();
            session.setAttribute("idAccount", account.getId());
            session.setAttribute("fullName", account.getFullName());
            int role = account.getRole();
            if (role == 1) {
                resp.sendRedirect("/admin?action=home");
            } else {
                resp.sendRedirect("/account?action=login");
            }
        }
    }

}
