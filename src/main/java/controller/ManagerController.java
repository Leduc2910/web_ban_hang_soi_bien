package controller;

import filter.SessionUser;
import model.Account;
import model.Category;
import model.Product;
import service.AccountService;
import service.CategoryService;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManagerController", value = "/admin")
public class ManagerController extends HttpServlet {
    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();
    private AccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
<<<<<<< HEAD
        if (SessionUser.checkUser(req)) {
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
                case "managerAccount":
                    showAllAccount(req, resp);
                    break;
                case "addProduct":
                    showFormAddProduct(req, resp);
                    break;
                case "editProduct":
                    showFormEditProduct(req, resp);
                    break;
                case "editCategory":
                    showFormEditCategory(req, resp);
                    break;
                case "editAccount":
                    showFormEdit(req, resp);
                    break;
                case "detailProduct":
                    showFormDetailProduct(req, resp);
                    break;
                case "detailAccount":
                    showFormDetailAccount(req, resp);
                    break;
                case "deleteProduct":
                    deleteProduct(req, resp);
                    break;
                case "deleteCategory":
                    deleteCategory(req, resp);
                    break;
                case "deleteAccount":
                    deleteAccount(req, resp);
                    break;
            }
        } else {
            resp.sendRedirect("/account?action=login");
=======
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
            case "managerAccount":
                showAllAccount(req, resp);
                break;
            case "addProduct":
                showFormAddProduct(req, resp);
                break;
            case "editProduct":
                showFormEditProduct(req, resp);
                break;
            case "editCategory":
                showFormEditCategory(req, resp);
                break;
            case "editAccount":
                showFormEditAccount(req, resp);
                break;
            case "detailProduct":
                showFormDetailProduct(req, resp);
                break;
            case "detailAccount":
                showFormDetailAccount(req, resp);
                break;
            case "deleteProduct":
                deleteProduct(req, resp);
                break;
            case "deleteCategory":
                deleteCategory(req, resp);
                break;
            case "deleteAccount":
                deleteAccount(req, resp);
                break;
>>>>>>> 294e1f6394981c1b11c21bb480abd776ab1fc808
        }
    }


    private void deleteAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        accountService.delete(id);
        resp.sendRedirect("/admin?action=managerAccount");
    }

    private void deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        categoryService.delete(id);
        resp.sendRedirect("/admin?action=managerCategory");

    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.delete(id);
        resp.sendRedirect("/admin?action=managerProduct");
    }

    private void showFormDetailAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        for (Account a: accountService.findAll()) {
            if (a.getId() == id){
                req.setAttribute("account", a);
            }

        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/detailAccount");
        requestDispatcher.forward(req,resp);

    }

    private void showFormDetailProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        for (Product p : productService.findAll()) {
            if (p.getId() == id) {
                req.setAttribute("product", p);
            }
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/detailProduct.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showFormEditAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<Account> accountList = accountService.findAll();
        for (Account account: accountList) {
            if (account.getId() == id){
                req.setAttribute("account", account);
            }
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/editAccount.jsp");
        requestDispatcher.forward(req,resp);

    }

    private void showFormEditCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<Category> categoryList = categoryService.findAll();
        for (Category category : categoryList) {
            if (category.getId() == id) {
                req.setAttribute("category", category);
            }


        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/editCategory.jsp");
        requestDispatcher.forward(req, resp);
    }


    private void showFormEditProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        for (Product p :
                productService.findAll()) {
            if (p.getId() == id) {
                req.setAttribute("product", p);
            }
        }
        List<Category> categories = categoryService.findAll();
        req.setAttribute("listCategory", categories);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/editProduct.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showFormAddProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("listCategory", categories);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/addProduct.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showAllAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Account> accounts = accountService.findAll();
        req.setAttribute("listAccount", accounts);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/managerAccount.jsp");
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
        String fullName = SessionUser.getNameUser(req);
        req.setAttribute("fullName", fullName);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/index.jsp");
        requestDispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
<<<<<<< HEAD
        if (SessionUser.checkUser(req)) {
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
                case "editCategory":
                    editCategory(req, resp);
                    break;
                case "editProduct":
                    editProduct(req, resp);
                    break;
            }
        } else {
            resp.sendRedirect("/account?action=login");
        }
=======
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
            case "editCategory":
                editCategory(req, resp);
                break;
            case "editProduct":
                editProduct(req, resp);
                break;
            case "editAccount":
                editAccount(req,resp);
                break;

        }


>>>>>>> 294e1f6394981c1b11c21bb480abd776ab1fc808
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
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
        productService.edit(id, product);
        resp.sendRedirect("/admin?action=managerProduct");
    }

    private void editCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        Category category = new Category(id, name);
        categoryService.edit(id, category);
        resp.sendRedirect("/admin?action=managerCategory");
    }
    private void editAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String phoneNumber = req.getParameter("phoneNumber");
        String password = req.getParameter("password");
        int role = Integer.parseInt(req.getParameter("role"));
        String fullName = req.getParameter("fullName");
        Account account = new Account(id,phoneNumber,password,role,fullName);
        accountService.edit(id, account);
        resp.sendRedirect("/admin?action=managerAccount");
    }

    private void addCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        Category category = new Category(name);
        categoryService.add(category);
        resp.sendRedirect("/admin?action=managerCategory");
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
