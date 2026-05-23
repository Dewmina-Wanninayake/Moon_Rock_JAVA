package servlet;

import model.ViewedItem;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class RemoveViewedItemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the item description from request
        String description = request.getParameter("description");

        // Retrieve the list of viewed items from session
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
		List<ViewedItem> viewedItems = (List<ViewedItem>) session.getAttribute("viewedItems");

        // Remove the item from the list
        if (viewedItems != null && description != null) {
            viewedItems.removeIf(item -> description.equals(item.getDescription()));
        }

        // Update the session attribute
        session.setAttribute("viewedItems", viewedItems);

        // Redirect back to the recently viewed page
        response.sendRedirect("saved.jsp");
    }
}



