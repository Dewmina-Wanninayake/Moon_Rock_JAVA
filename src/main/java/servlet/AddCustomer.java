package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import services.CustomerService;

public class AddCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddCustomer() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User customer = new User();

        customer.setFirstname(request.getParameter("firstname"));
        customer.setLastname(request.getParameter("lastname"));
        customer.setEmail(request.getParameter("email"));
        customer.setPassword(request.getParameter("password"));
        customer.setPhone(request.getParameter("phone"));
        customer.setAddress(request.getParameter("address"));
        customer.setType("customer");

        // List to hold validation errors
        List<String> errors = new ArrayList<>();

        // Validation Logic
        if (!customer.getFirstname().matches("[A-Z][a-zA-Z]*")) {
            errors.add("First name must start with a capital letter.");
        }

        if (!customer.getLastname().matches("[A-Z][a-zA-Z]*")) {
            errors.add("Last name must start with a capital letter.");
        }

        if (!customer.getPhone().matches("0\\d{9}")) {
            errors.add("Phone number must start with 0 and be exactly 10 digits long.");
        }

        if (!customer.getEmail().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            errors.add("Please enter a valid email address.");
        }

        if (customer.getPassword() == null || customer.getPassword().trim().isEmpty()) {
            errors.add("Password cannot be empty.");
        }

        if (customer.getAddress() == null || customer.getAddress().trim().isEmpty()) {
            errors.add("Address cannot be empty.");
        }

        // If there are validation errors, send them back to the form
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("customer", customer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerReg.jsp");
            dispatcher.forward(request, response);
        } else {
            // If no errors, register customer and redirect
            CustomerService service = new CustomerService();
            service.regCustomer(customer);

            response.sendRedirect("Admin.jsp");
        }
    }
}
