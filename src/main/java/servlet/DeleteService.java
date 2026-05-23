package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.APackage;

import services.AdminPackage;



public class DeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteService() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		APackage pack = new APackage();
		
		int serviceId = Integer.parseInt(request.getParameter("serviceID"));
		pack.setServiceID(serviceId);
		
		AdminPackage service = new AdminPackage();
		service.deletePack(pack);
		
		
		response.sendRedirect("AdminServiceTbl");

	}

}
