package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Admin;
import services.AdminService;

public class UpdateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UpdateAdmin() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Admin admin = new Admin();
		
		admin.setAid(Integer.parseInt(request.getParameter("aid").trim()));
		admin.setFirstname(request.getParameter("firstname"));
		admin.setLastname(request.getParameter("lastname"));
		admin.setPhone(request.getParameter("phone"));
		admin.setEmail(request.getParameter("email"));
		admin.setPassword(request.getParameter("password"));

		
		AdminService service = new AdminService();
		service.updateAdmin(admin);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");/*redirecting page(change this)*/
		dispatcher.forward(request, response);
	}

}
