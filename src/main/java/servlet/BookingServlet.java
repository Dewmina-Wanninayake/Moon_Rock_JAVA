package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String arrival = request.getParameter("arrival");
        String departure = request.getParameter("departure");

       
        HttpSession session = request.getSession();
        session.setAttribute("arrival", arrival);
        session.setAttribute("departure", departure);

       
        response.sendRedirect("room.jsp");
    }
}

