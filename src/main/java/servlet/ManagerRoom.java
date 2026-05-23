package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Room;
import services.RoomServices;


public class ManagerRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerRoom() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RoomServices services = new RoomServices();
		ArrayList<Room> Room = services.getAllRoom();
		request.setAttribute("room", Room);

		RequestDispatcher dispatcher = request.getRequestDispatcher("manager.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); // POST requests redirect to doGet
	}
}

