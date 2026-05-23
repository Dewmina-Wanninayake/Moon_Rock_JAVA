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
import services.StaffService;

public class AddStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AddStaff() {
        super();
        
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User stf = new User();
		
		stf.setFirstname(request.getParameter("firstname"));
		stf.setLastname(request.getParameter("lastname"));
		stf.setEmail(request.getParameter("email"));
		stf.setPassword(request.getParameter("password"));
		stf.setPhone(request.getParameter("phone"));
		stf.setAddress(request.getParameter("address"));
		stf.setType(request.getParameter("type"));
		
        List<String> errors = new ArrayList<>();

        // Validation 
        if (!stf.getFirstname().matches("[A-Z][a-zA-Z]*")) {
            errors.add("First name must start with a capital letter.");
        }

        if (!stf.getLastname().matches("[A-Z][a-zA-Z]*")) {
            errors.add("Last name must start with a capital letter.");
        }

        if (!stf.getPhone().matches("0\\d{9}")) {
            errors.add("Phone number must start with 0 and be exactly 10 digits long.");
        }

        if (!stf.getEmail().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            errors.add("Please enter a valid email address.");
        }

        if (stf.getPassword() == null || stf.getPassword().trim().isEmpty()) {
            errors.add("Password cannot be empty.");
        }

        if (stf.getAddress() == null || stf.getAddress().trim().isEmpty()) {
            errors.add("Address cannot be empty.");
        }

        
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("stf", stf);
            RequestDispatcher dispatcher = request.getRequestDispatcher("StaffRegister.jsp");
            dispatcher.forward(request, response);
        } else {
            
            StaffService service = new StaffService();
            service.regStaff(stf);

            response.sendRedirect("Admin.jsp");
        }
    }

}
