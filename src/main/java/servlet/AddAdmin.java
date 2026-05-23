package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Admin;
import services.AdminService;

public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddAdmin() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Admin admin = new Admin();
		
		admin.setFirstname(request.getParameter("firstname"));
		admin.setLastname(request.getParameter("lastname"));
		admin.setPhone(request.getParameter("phone"));
		admin.setEmail(request.getParameter("email"));
		admin.setPassword(request.getParameter("password"));
		
		
        // List to hold validation errors
        List<String> errors = new ArrayList<>();

        // Validation Logic
        if (!admin.getFirstname().matches("[A-Z][a-zA-Z]*")) {
            errors.add("First name must start with a capital letter.");
        }
        
        if (!admin.getLastname().matches("[A-Z][a-zA-Z]*")) {
            errors.add("Last name must start with a capital letter.");
        }
        
        if (!admin.getPhone().matches("0\\d{9}")) {
            errors.add("Phone number must start with 0 and be exactly 10 digits long.");
        }

        if (!admin.getEmail().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            errors.add("Please enter a valid email address.");
        }

        if (admin.getPassword() == null || admin.getPassword().trim().isEmpty()) {
            errors.add("Password cannot be empty.");
        }

        // If there are validation errors, send them back to the form
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("admin", admin); 
            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminRegister.jsp");
            dispatcher.forward(request, response);
        } else {
            // If no errors, register admin and redirect
            AdminService service = new AdminService();
            service.regAdmin(admin);
	
            
            response.sendRedirect("Admin.jsp");
        }

		
	}
	
}


