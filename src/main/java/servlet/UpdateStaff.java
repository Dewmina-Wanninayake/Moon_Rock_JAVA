package servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.User;
import services.StaffService;


public class UpdateStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UpdateStaff() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User stf = new User();
		
		stf.setUid(Integer.parseInt(request.getParameter("uid").trim()));
		stf.setFirstname(request.getParameter("firstname"));
		stf.setLastname(request.getParameter("lastname"));
		stf.setEmail(request.getParameter("email"));
		stf.setPassword(request.getParameter("password"));
		stf.setPhone(request.getParameter("phone"));
		stf.setAddress(request.getParameter("address"));
		stf.setType(request.getParameter("type"));
		
		StaffService service = new StaffService();
		service.UpdateStaff(stf);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");/*redirecting page(change this)*/
		dispatcher.forward(request, response);
	}

}
