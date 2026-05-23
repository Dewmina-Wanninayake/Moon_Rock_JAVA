package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.APackage;
import services.AdminPackage;


public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateService() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		APackage pack = new APackage();
		
	    pack.setServiceID(Integer.parseInt(request.getParameter("serviceID").trim()));
	    pack.setServiceName(request.getParameter("serviceName"));
	    pack.setServiceType(request.getParameter("serviceType"));

	    
	    pack.setAvailability("1".equals(request.getParameter("availability")));

	    
	    pack.setPrice(new BigDecimal(request.getParameter("price")));
	    pack.setDiscount(new BigDecimal(request.getParameter("discount")));

	    
	    pack.setDateAdded(Date.valueOf(request.getParameter("dateAdded")));

	    
	    pack.setDescription(request.getParameter("description"));
	    pack.setImage(request.getParameter("image"));

        
        AdminPackage service2 = new AdminPackage();
        service2.updatePack(pack);
        
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");/*redirecting page*/
		dispatcher.forward(request, response);
	}

}
