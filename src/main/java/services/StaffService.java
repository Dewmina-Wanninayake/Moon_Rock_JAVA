package services;

import java.sql.ResultSet;


import java.sql.Statement;
import java.util.ArrayList;


import model.User;
import utils.DBconnect;

public class StaffService {
	
	public void regStaff(User stf) {/*Add staff*/
		try {
			
			String query = "insert into user (firstname, lastname, emailAddy, password, phoneNo, address, type) VALUES('"
			+stf.getFirstname()+"','"
			+stf.getLastname()+"','"
			+stf.getEmail()+"','"
			+stf.getPassword()+"','"
			+stf.getPhone()+"','"
			+stf.getAddress()+"','"
			+stf.getType() + "')";
			
			
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
	public void UpdateStaff(User staff) {/*update staff*/
		try {
			
			String query = "update user SET "
		            + "firstname='" + staff.getFirstname() + "', "
		            + "lastname='" + staff.getLastname() + "', "
		            + "emailAddy='" + staff.getEmail() + "', "
		            + "password='" + staff.getPassword() + "', "
		            + "phoneNo='" + staff.getPhone() + "', "
		            + "address='" + staff.getAddress() + "', "
		            + "type='" + staff.getType() + "' "
		            + "WHERE uid=" + staff.getUid();
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<User> getAllStaff(){ /*Read staff table*/
		try {
			ArrayList<User> listStf = new ArrayList<User>();
			
			String query = "SELECT * FROM user WHERE type != 'customer'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				User stf = new User();
				stf.setUid(rs.getInt("UID"));
				stf.setFirstname(rs.getString("firstname"));
				stf.setLastname(rs.getString("lastname"));
				stf.setEmail(rs.getString("emailAddy"));
				stf.setPassword(rs.getString("password"));
				stf.setPhone(rs.getString("phoneNo"));
				stf.setAddress(rs.getString("address"));
				stf.setType(rs.getString("type"));
				
				listStf.add(stf);
				
			}
			
			return listStf;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	

	public void deleteStaff(User stf) { /*delete staff*/
		try {
			
			String query = "Delete from user where UID = '"+stf.getUid()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
			System.out.println("Staff deleted successfully.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public User SingleDataButton(User stf) {/*single data button*/
		try {
			
			String query = "select*from where email = '"+stf.getEmail()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				stf.setFirstname(rs.getString("firstname"));
				stf.setLastname(rs.getString("lastname"));
				stf.setEmail(rs.getString("email"));
				stf.setPhone(rs.getString("phone"));
				
				return stf;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
