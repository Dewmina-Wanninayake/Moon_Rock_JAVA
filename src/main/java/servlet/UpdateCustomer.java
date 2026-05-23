package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import services.CustomerService;


public class UpdateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateCustomer() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User cus = new User();
		
		cus.setUid(Integer.parseInt(request.getParameter("uid").trim()));
		cus.setFirstname(request.getParameter("firstname"));
		cus.setLastname(request.getParameter("lastname"));
		cus.setEmail(request.getParameter("email"));
		cus.setPassword(request.getParameter("password"));
		cus.setPhone(request.getParameter("phone"));
		cus.setAddress(request.getParameter("address"));
		
		cus.setType("customer");
		
		CustomerService service = new CustomerService();
		service.updateCustomer(cus);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");/*redirecting page*/
		dispatcher.forward(request, response);
		
	}

}
