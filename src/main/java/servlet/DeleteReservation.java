package servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReservationEdit;

import services.ReservationServices;


public class DeleteReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteReservation() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReservationEdit Re = new ReservationEdit();
		int rid = Integer.parseInt(request.getParameter("id1"));
		Re.setRID(rid);
		
		
		
		ReservationServices services = new ReservationServices();
		
		services.deleteReservatione(Re);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ManagerReservation");
		dispatcher.forward(request, response);
		
		
		
		
	}

}
