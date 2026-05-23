package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

public class UpdateSessionDatesServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String arrival = request.getParameter("arrival");
        String departure = request.getParameter("departure");

        HttpSession session = request.getSession();
        if (arrival != null) {
            session.setAttribute("arrival", arrival);
        }
        if (departure != null) {
            session.setAttribute("departure", departure);
        }

        response.setStatus(HttpServletResponse.SC_OK);
    }
}
