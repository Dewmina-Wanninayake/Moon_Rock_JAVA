package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Admin;
import services.AdminService;

public class AdminTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminTable() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminService service3 = new AdminService();
		
		ArrayList<Admin> admin = service3.getAllAdmin();
		
		request.setAttribute("admin", admin);
		
	    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");/*StaffTable.jsp*/
	    dispatcher.forward(request, response);
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
