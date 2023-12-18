package controller;

import filter.SessionUser;
import filter.Validate;
import model.Account;
import model.Category;
import service.AccountService;
import service.CategoryService;

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
    private CategoryService categoryService = new CategoryService();

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
            case "register":
                showFormRegister(req, resp);
                break;
        }
    }

    private void showFormRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (SessionUser.getUserSession(req) == null) {
            List<Category> categoryList = categoryService.findAll();
            req.setAttribute("listCategory", categoryList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("account/register.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            resp.sendRedirect("/home?action=home");
        }
    }

    private void logoutAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect("/home?action=home");
    }

    private void showFormLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (SessionUser.getUserSession(req) == null) {
            List<Category> categoryList = categoryService.findAll();
            req.setAttribute("listCategory", categoryList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("account/login.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            resp.sendRedirect("/home?action=home");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "login":
                checkLogin(req, resp);
                break;
            case "register":
                registerAccount(req, resp);
                break;
        }
    }

    private void registerAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String phoneNumber = req.getParameter("phoneNumber");
        String password = req.getParameter("password");
        String fullName = req.getParameter("fullName");
        String error = "";
        String error1 = "";
        String error2 = "";
        boolean isCorrect = true;
        if (fullName.trim().isEmpty()) {
            error = "* Vui lòng nhập họ và tên.";
            req.setAttribute("error", error);
            isCorrect = false;
        }
        if (phoneNumber.trim().isEmpty() || !Validate.regexPhoneNumber(phoneNumber)) {
            error1 = "* Vui lòng nhập số điện thoại hợp lệ";
            req.setAttribute("error1", error1);
            isCorrect = false;
        }
        if (accountService.checkPhoneNumber(phoneNumber)) {
            error1 = "* Số điện thoại này đã tồn tại.";
            req.setAttribute("error1", error1);
            isCorrect = false;
        }
        if (password.trim().isEmpty()) {
            error2 = "* Vui lòng nhập mật khẩu.";
            req.setAttribute("error2", error2);
            isCorrect = false;
        }
        if (isCorrect) {
            Account account = new Account(phoneNumber, password, fullName);
            accountService.add(account);
            resp.sendRedirect("/account?action=login");
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("account/register.jsp");
            requestDispatcher.forward(req, resp);
        }
    }


    private void checkLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String phoneNumber = req.getParameter("phoneNumber");
        String password = req.getParameter("password");
        String error = "";
            if (accountService.checkAccount(phoneNumber, password)) {
                Account account = accountService.getAccount(phoneNumber, password);
                HttpSession session = req.getSession();
                session.setAttribute("account", account);
                session.setAttribute("role", account.getRole());
                session.setAttribute("fullName", account.getFullName());
                resp.sendRedirect("/home?action=home");
            } else {
                error = "* Tài khoản hoặc mật khẩu không hợp lệ.";
                req.setAttribute("error", error);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("account/login.jsp");
                requestDispatcher.forward(req, resp);
            }
    }
}
