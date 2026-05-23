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


public class AddPackage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       

    public AddPackage() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		APackage pack = new APackage();
		
       
        pack.setServiceName(request.getParameter("serviceName"));
        pack.setServiceType(request.getParameter("serviceType"));

        
        String availabilityStr = request.getParameter("availability");
        pack.setAvailability(availabilityStr != null && availabilityStr.equals("1"));

        
        pack.setPrice(new BigDecimal(request.getParameter("price")));
        pack.setDiscount(new BigDecimal(request.getParameter("discount")));

        
        String dateStr = request.getParameter("dateAdded");
        Date sqlDate = dateStr != null && !dateStr.isEmpty() ? Date.valueOf(dateStr) : new Date(System.currentTimeMillis());
        pack.setDateAdded(sqlDate);

        
        pack.setDescription(request.getParameter("description"));
        pack.setImage(request.getParameter("image"));


        
	    AdminPackage service = new AdminPackage();
	    service.regService(pack);
	    
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");/*redirecting page*/
		dispatcher.forward(request, response);
		

	}

}
