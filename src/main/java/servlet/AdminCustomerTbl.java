package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import services.CustomerService;


public class AdminCustomerTbl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AdminCustomerTbl() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 CustomerService service1 = new CustomerService();
		    
		    ArrayList<User> customer = service1.getAllCus();
		    
		    request.setAttribute("customer", customer);
		    
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
		    dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
