package servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Room;

import services.RoomServices;

public class DeleteRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteRoom() {
        super();
        
    }

	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Room Rm = new Room();

		int rid = Integer.parseInt(request.getParameter("id"));
		Rm.setRID(rid);

		
		RoomServices services = new RoomServices();
		
		services.deleteRoom(Rm);
		
		
		
		
		response.sendRedirect("ManagerRoom");
		
		
	}


	
		
	

}
