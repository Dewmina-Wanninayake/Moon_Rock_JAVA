package services;

import java.sql.*;
import model.newCustomer;
import utils.DBconnect;

public class newCustomerService {

    // Register a new customer
    public void regNewCustomer(newCustomer newcustomer) {
        String query = "INSERT INTO user (firstname, lastname, emailAddy, password, PhoneNo, address, type) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, newcustomer.getFname());
            stmt.setString(2, newcustomer.getLname());
            stmt.setString(3, newcustomer.getEmail());
            stmt.setString(4, newcustomer.getPassword());
            stmt.setString(5, newcustomer.getPhone());
            stmt.setString(6, newcustomer.getAddress());
            stmt.setString(7, newcustomer.getRole());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle database exceptions
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // Handle class not found exceptions (if you are using an old JDBC driver)
        }
    }

    // Validate login credentials
    public newCustomer validation(newCustomer loginAttempt) {
        newCustomer validUser = null;

        String userQuery = "SELECT * FROM user WHERE emailAddy = ? AND password = ?";
        String adminQuery = "SELECT * FROM admin WHERE emailAddy = ? AND password = ?";

        try (Connection conn = DBconnect.getConnection()) {
            // First try user table
            try (PreparedStatement stmt = conn.prepareStatement(userQuery)) {
                stmt.setString(1, loginAttempt.getEmail());
                stmt.setString(2, loginAttempt.getPassword());
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    validUser = new newCustomer();
                    validUser.setFname(rs.getString("firstname"));
                    validUser.setLname(rs.getString("lastname"));
                    validUser.setEmail(rs.getString("emailAddy"));
                    validUser.setPassword(rs.getString("password"));
                    validUser.setPhone(rs.getString("PhoneNo"));
                    validUser.setAddress(rs.getString("address"));
                    validUser.setRole(rs.getString("type"));
                    return validUser;
                }
            }

            // Then try admin table
            try (PreparedStatement stmt = conn.prepareStatement(adminQuery)) {
                stmt.setString(1, loginAttempt.getEmail());
                stmt.setString(2, loginAttempt.getPassword());
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    validUser = new newCustomer();
                    validUser.setEmail(rs.getString("emailAddy"));
                    validUser.setLname(rs.getString("lastName"));
                    validUser.setRole("admin");
                    return validUser;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle SQL exceptions
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // Handle class not found exceptions (if you are using an old JDBC driver)
        }

        return null; // login failed
    }

    // Fetch customer info
    public newCustomer info(newCustomer user) {
        String query = "SELECT * FROM user WHERE emailAddy = ?";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getEmail());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user.setFname(rs.getString("firstname"));
                user.setLname(rs.getString("lastname"));
                user.setEmail(rs.getString("emailAddy"));
                user.setPhone(rs.getString("PhoneNo"));
                user.setAddress(rs.getString("address"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle SQL exceptions
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // Handle class not found exceptions (if you are using an old JDBC driver)
        }
        return null;
    }

    // Update customer profile
    public void updateCustomer(newCustomer user) {
        String query = "UPDATE user SET firstname = ?, lastname = ?, PhoneNo = ?, address = ? WHERE emailAddy = ?";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getFname());
            stmt.setString(2, user.getLname());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getAddress());
            stmt.setString(5, user.getEmail());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle SQL exceptions
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // Handle class not found exceptions (if you are using an old JDBC driver)
        }
    }
}
