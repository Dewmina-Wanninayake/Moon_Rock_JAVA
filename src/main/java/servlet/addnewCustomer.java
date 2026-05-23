package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.newCustomer;
import services.newCustomerService;

public class addnewCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public addnewCustomer() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		newCustomer newcustomer = new newCustomer();
		newcustomer.setFname(request.getParameter("fname"));
		newcustomer.setLname(request.getParameter("lname"));
		newcustomer.setEmail(request.getParameter("email"));
		newcustomer.setPhone(request.getParameter("phone"));
		newcustomer.setAddress(request.getParameter("address"));
		newcustomer.setPassword(request.getParameter("password"));
		newcustomer.setRole(request.getParameter("role"));
		
		newCustomerService service = new newCustomerService();
		
		
		try {
			service.regNewCustomer(newcustomer);
			response.sendRedirect("login.jsp");
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("eror", "Userr registation failed. plz try again");
			request.getRequestDispatcher("registration.jsp").forward(request, response);
			
		}
		
	}

}
