package servlet;

import java.io.IOException;


import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.User;
import services.StaffService;


public class AdminStaffTbl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminStaffTbl() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 StaffService service = new StaffService();
		    
		    ArrayList<User> staff = service.getAllStaff();
		    
		    request.setAttribute("staff", staff);
		    
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");/*StaffTable.jsp*/
		    dispatcher.forward(request, response);
		
		    
		    
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	doGet(request, response);
		
	}

}
