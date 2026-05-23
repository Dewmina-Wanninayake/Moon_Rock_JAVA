package services;


import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;

import model.APackage;
import utils.DBconnect;

public class AdminPackage {
	
	public void regService(APackage pack) { //Add package
		try {
			String query = "INSERT INTO Service (serviceName , serviceType , availability , price , discount , dateAdded , description , image) VALUES ('"
                    + pack.getServiceName() + "', '"
                    + pack.getServiceType() + "', "
                    + (pack.isAvailability() ? 1 : 0) + ", " 
                    + pack.getPrice() + ", "
                    + pack.getDiscount() + ", '"
                    + pack.getDateAdded() + "', '"
                    + pack.getDescription() + "', '"
                    + pack.getImage() + "')";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void updatePack(APackage pack) { //Update package
		try {
			
			String query = "UPDATE Service SET "
		            + "serviceName = '" + pack.getServiceName() + "', "
		            + "serviceType = '" + pack.getServiceType() + "', "
		            + "availability = " + (pack.isAvailability() ? 1 : 0) + ", "
		            + "price = " + pack.getPrice() + ", "
		            + "discount = " + pack.getDiscount() + ", "
		            + "dateAdded = '" + pack.getDateAdded() + "', "
		            + "description = '" + pack.getDescription() + "', "
		            + "image = '" + pack.getImage() + "' "
		            + "WHERE ServiceID = " + pack.getServiceID();

			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<APackage>getAllPack(){ //Read packages
		try {
			
			ArrayList<APackage>listPackage = new ArrayList<APackage>();
			
			String query = "SELECT * FROM Service";
			
			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while (rs.next()) {
				APackage pack = new APackage();
				
				pack.setServiceID(rs.getInt("ServiceID")); //DB Column names
				pack.setServiceName(rs.getString("serviceName"));
				pack.setServiceType(rs.getString("serviceType"));
				pack.setAvailability(rs.getBoolean("availability"));
				pack.setPrice(rs.getBigDecimal("price"));
				pack.setDiscount(rs.getBigDecimal("discount"));
				pack.setDateAdded(rs.getDate("dateAdded"));
				pack.setDescription(rs.getString("description"));
				pack.setImage(rs.getString("image"));
				
				listPackage.add(pack);
			}
			
			return listPackage;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
	}
	
	public void deletePack(APackage pack) { //Delete service
		try {
			
			String query = "DELETE FROM Service WHERE ServiceID = '" +pack.getServiceID()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
