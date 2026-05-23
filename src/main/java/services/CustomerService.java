package services;



import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;

import model.User;
import utils.DBconnect;

public class CustomerService {
	
	public void regCustomer(User cus) { /*Add customer*/
		try {
			String query = "insert into user (firstname, lastname, emailAddy, password, phoneNo, address, type) VALUES('"
					+cus.getFirstname()+"','"
					+cus.getLastname()+"','"
					+cus.getEmail()+"','"
					+cus.getPassword()+"','"
					+cus.getPhone()+"','"
					+cus.getAddress()+"','"
					+"customer')";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<User>getAllCus(){ /*Read customer*/
		try {
			ArrayList<User> listCus = new ArrayList<User>();
			
			String query = "select*from user where type='customer'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				User cus = new User();
				
				cus.setUid(rs.getInt("UID"));
				cus.setFirstname(rs.getString("firstname"));
				cus.setLastname(rs.getString("lastname"));
				cus.setEmail(rs.getString("emailAddy"));
				cus.setPassword(rs.getString("password"));
				cus.setPhone(rs.getString("phoneNo"));
				cus.setAddress(rs.getString("address"));
				cus.setType(rs.getString("type"));
				
				listCus.add(cus);
			}
			
			return listCus;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public void updateCustomer(User cus) { /*Update customer*/
		try {
			
			String query = "UPDATE user SET "
		            + "firstname='" + cus.getFirstname() + "', "
		            + "lastname='" + cus.getLastname() + "', "
		            + "emailAddy='" + cus.getEmail() + "', "
		            + "password='" + cus.getPassword() + "', "
		            + "phoneNo='" + cus.getPhone() + "', "
		            + "address='" + cus.getAddress() + "', "
		            + "type='" + cus.getType() + "' "
		            + "WHERE uid=" + cus.getUid();
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteCustomer(User cus) { /*Delete customer*/
		try {
			String query = "DELETE FROM user WHERE UID = '"+cus.getUid()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int getCustomerCount() {  // Customer count method 
	    int count = 0;
	    try {
	        // Corrected SQL query with proper string comparison
	        String query = "SELECT COUNT(*) AS total FROM customer WHERE type = 'customer'"; 
	        
	        Connection connection = DBconnect.getConnection();
	        Statement statement = connection.createStatement();
	        
	        ResultSet rs = statement.executeQuery(query);

	        if (rs.next()) {
	            count = rs.getInt("total");
	        }
	        
	        rs.close();
	        statement.close();
	        connection.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}


}
