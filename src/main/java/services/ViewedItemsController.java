package services;

import model.ViewedItem;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpSession;

public class ViewedItemsController {

    // Method to save viewed items to a temporary table
    public static void saveViewedItemsToTemporaryTable(HttpSession session, Connection conn) {
        @SuppressWarnings("unchecked")
		List<ViewedItem> viewedItems = (List<ViewedItem>) session.getAttribute("viewedItems");

        if (viewedItems != null && !viewedItems.isEmpty()) {
            PreparedStatement stmt = null;

            try {
                // Create the temporary table
                String createTableQuery = "CREATE TEMPORARY TABLE IF NOT EXISTS user_viewed (" +
                                          "id INT, " +
                                          "type VARCHAR(50), " +
                                          "description TEXT, " +
                                          "image VARCHAR(255), " +
                                          "date_range VARCHAR(100), " +
                                          "price DECIMAL(10, 2), " +
                                          "is_modified BOOLEAN)";
                stmt = conn.prepareStatement(createTableQuery);
                stmt.executeUpdate();

                // Insert items into the temporary table
                for (ViewedItem item : viewedItems) {
                    String insertQuery = "INSERT INTO user_viewed (id, type, description, image, date_range, price, is_modified) " +
                                         "VALUES (?, ?, ?, ?, ?, ?, ?)";
                    stmt = conn.prepareStatement(insertQuery);

                    // Set the item values
                    stmt.setInt(1, (item.getType().equals("room")) ? getRoomId(conn, item.getDescription()) : getServiceId(conn, item.getDescription()));
                    stmt.setString(2, item.getType());
                    stmt.setString(3, item.getDescription());
                    stmt.setString(4, item.getImage());
                    stmt.setString(5, item.getDateRange());
                    stmt.setDouble(6, item.getPrice());
                    stmt.setBoolean(7, item.isModified());

                    stmt.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (stmt != null) stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // Helper method to get Room ID from room name
    private static int getRoomId(Connection conn, String roomDescription) throws SQLException {
        String query = "SELECT RID FROM room WHERE name = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, roomDescription);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("RID");
        }
        return -1;
    }

    // Helper method to get Service ID from service name
    private static int getServiceId(Connection conn, String serviceDescription) throws SQLException {
        String query = "SELECT ServiceID FROM service WHERE serviceName = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, serviceDescription);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("ServiceID");
        }
        return -1;
    }
}

