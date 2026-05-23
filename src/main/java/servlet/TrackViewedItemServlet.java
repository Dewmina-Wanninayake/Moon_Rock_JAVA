package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SessionItemManager;
import model.ViewedItem;
import model.ViewedItemFactory;

public class TrackViewedItemServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // 1. Retrieve parameters
        String type = request.getParameter("type");
        int id = Integer.parseInt(request.getParameter("id"));
        String desc = request.getParameter("description");
        String image = request.getParameter("image");
        String date = request.getParameter("date");
        double price = Double.parseDouble(request.getParameter("price"));
        boolean modified = Boolean.parseBoolean(request.getParameter("modified"));

        // Extra: for room date range
        String arrival = request.getParameter("arrival");
        String departure = request.getParameter("departure");
        String updatedDateRange = (arrival != null && departure != null) 
                ? arrival + " to " + departure 
                : "Not selected";

        HttpSession session = request.getSession();
        List<ViewedItem> viewedItems = SessionItemManager.getInstance().getViewedItems(session);

        boolean found = false;
        for (ViewedItem item : viewedItems) {
            if (item.getId() == id && "room".equals(item.getType())) {
                // Update date range only for room
                item.setDateRange(updatedDateRange);
                found = true;
                break;
            }
        }

        if (!found) {
            // Set date to the updated range only if it's a room
            if ("room".equals(type)) {
                date = updatedDateRange;
            }
            ViewedItem item = ViewedItemFactory.createViewedItem(type, id, desc, image, date, price, modified);
            SessionItemManager.getInstance().addItem(session, item);
        }

        response.sendRedirect("viewedItems.jsp"); // Redirect after storing
    }
}
