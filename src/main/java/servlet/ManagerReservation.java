package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReservationEdit;
import services.ReservationServices;



public class ManagerReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ManagerReservation() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReservationServices services =new ReservationServices();
		ArrayList<ReservationEdit>Reservation = services.getAllReservationEdit();
		request.setAttribute("reservation", Reservation);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("manager.jsp");
		
		
		dispatcher.forward(request, response);
	}

}
