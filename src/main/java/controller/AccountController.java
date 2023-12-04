package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AccountController", value = "/account")

public class AccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "showAllAccount":
                showAllAccount(req, resp);
                break;
            case "editAccount":
                showFormEdit(req, resp);
                break;
        }
    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showAllAccount(HttpServletRequest req, HttpServletResponse resp) {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "editAccount":
                editAccount(req, resp);
                break;
        }
    }

    private void editAccount(HttpServletRequest req, HttpServletResponse resp) {
    }
}
