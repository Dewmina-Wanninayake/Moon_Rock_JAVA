package servlet;

import java.io.IOException;


/*import javax.servlet.RequestDispatcher;*/
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.User;
import services.StaffService;


public class DeleteStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public DeleteStaff() {
        super();
  
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User stf = new User();
		
		int staffId = Integer.parseInt(request.getParameter("id"));
		stf.setUid(staffId);
		
		StaffService service = new StaffService();
		service.deleteStaff(stf);
		
		
		response.sendRedirect("AdminStaffTbl");

	}

}
