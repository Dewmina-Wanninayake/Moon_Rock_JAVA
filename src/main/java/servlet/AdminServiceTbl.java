package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.APackage;

import services.AdminPackage;


public class AdminServiceTbl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminServiceTbl() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminPackage service5 = new AdminPackage();
		
	    ArrayList<APackage> serviceP = service5.getAllPack();
	    
	    request.setAttribute("serviceP", serviceP);
	    
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
	    dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
