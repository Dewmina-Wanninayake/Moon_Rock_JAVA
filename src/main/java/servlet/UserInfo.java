package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.newCustomer;
import services.newCustomerService;


public class UserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserInfo() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		newCustomer newCustomer =new newCustomer();
		newCustomer.setEmail(request.getParameter("emailAddy"));
		newCustomerService service = new newCustomerService();
		newCustomer usr =service.info(newCustomer);
		RequestDispatcher dispatcher =request.getRequestDispatcher("profile.jsp");
		request.setAttribute("userdetails", usr);
		
		
		dispatcher.forward(request, response);

	}

}
