package services;





import java.sql.ResultSet;


import java.sql.Statement;
import java.util.ArrayList;

import model.Admin;
import utils.DBconnect;

public class AdminService {
	
	public void regAdmin(Admin admin) { /*add admin*/
		try {
			String query = "insert into admin (firstName , lastName , PhoneNo , emailAddy , password) VALUES('"
					+admin.getFirstname()+"','"
					+admin.getLastname()+"','"
					+admin.getPhone()+"','"
					+admin.getEmail()+"','"
					+admin.getPassword()+"')";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateAdmin(Admin admin) { /*update admin*/
		try {
			String query = "UPDATE admin SET "
					 +"firstName='" + admin.getFirstname() + "', "
					 +"lastName='" + admin.getLastname() + "', "
					 +"PhoneNo='" + admin.getPhone() + "', "
					 +"emailAddy='" + admin.getEmail() + "', "
					 +"password='" + admin.getPassword() + "' "
					 + "where AdminID=" + admin.getAid();
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
					 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Admin>getAllAdmin(){ /*read admin*/
		try {
			ArrayList<Admin>listadmin = new ArrayList<Admin>();
			
			String query = "SELECT*FROM admin";

			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while (rs.next()) {
				Admin admin = new Admin();
				
				admin.setAid(rs.getInt("AdminID"));
				admin.setFirstname(rs.getString("firstName"));
				admin.setLastname(rs.getString("lastName"));
				admin.setPhone(rs.getString("PhoneNo"));
				admin.setEmail(rs.getString("emailAddy"));
				admin.setPassword(rs.getString("password"));
				
				listadmin.add(admin);
			}
			
			return listadmin;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public void deleteAdmin(Admin admin) { /*delete admin*/
		try {
			String query = "DELETE FROM admin WHERE AdminID = '"+admin.getAid()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
			System.out.println("Admin deleted successfully.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    public int getAdminCount(String tableName) { //admin count
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM admin";
            Statement statement = DBconnect.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                count = resultSet.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
	
	
	

}
