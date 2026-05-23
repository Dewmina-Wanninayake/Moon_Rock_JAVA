package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import services.CustomerService;



public class DeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public DeleteCustomer() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User cus = new User();
		
		int cusId = Integer.parseInt(request.getParameter("id"));
		cus.setUid(cusId);
		
		CustomerService service = new CustomerService();
		service.deleteCustomer(cus);
		
		
		response.sendRedirect("AdminCustomerTbl");
		
	}

}
