package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Admin;
import services.AdminService;



public class DeleteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public DeleteAdmin() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin admin = new Admin();
		
		int adminid = Integer.parseInt(request.getParameter("id"));
		admin.setAid(adminid);
		
		AdminService service = new AdminService();
		service.deleteAdmin(admin);
		
		
		response.sendRedirect("AdminTable");
	}

}
