package servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.User;
import services.StaffService;


public class SingleDataButton extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SingleDataButton() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User stf = new User();
		stf.setEmail(request.getParameter("email"));
		
		StaffService service = new StaffService();
		
		User staff = service.SingleDataButton(stf);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("SUpdate.jsp");
		request.setAttribute("staff", staff);
		
		dispatcher.forward(request, response);
	}

}
