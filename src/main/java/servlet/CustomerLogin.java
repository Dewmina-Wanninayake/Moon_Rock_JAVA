package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.newCustomer;
import services.newCustomerService;

public class CustomerLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CustomerLogin() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        newCustomer loginAttempt = new newCustomer();
        loginAttempt.setEmail(email);
        loginAttempt.setPassword(password);

        newCustomerService services = new newCustomerService();
        newCustomer validatedUser = services.validation(loginAttempt);

        if (validatedUser != null) {
            // Set session attribute to store the user's details
            HttpSession session = request.getSession();
            session.setAttribute("username", validatedUser.getLname());
            session.setAttribute("email", validatedUser.getEmail());
            session.setAttribute("userRole", validatedUser.getRole()); // Optionally store user role

            // You can also set the full customer details if necessary
            request.setAttribute("customerdetails", validatedUser);

            String userType = validatedUser.getRole();

            RequestDispatcher dispatcher;
            if ("customer".equalsIgnoreCase(userType)) {
                dispatcher = request.getRequestDispatcher("index.jsp");
            } else if ("manager".equalsIgnoreCase(userType)) {
                dispatcher = request.getRequestDispatcher("index.jsp");
            } else if ("admin".equalsIgnoreCase(userType)) {
                dispatcher = request.getRequestDispatcher("index.jsp");
            } else {
                dispatcher = request.getRequestDispatcher("index.jsp");
            }
            dispatcher.forward(request, response);

        } else {
            // Login failed
            request.setAttribute("errorMessage", "Invalid email or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("signIn.jsp");
            dispatcher.forward(request, response);
        }
    }
}
