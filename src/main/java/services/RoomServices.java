package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Room;

import utils.DBconnect;

public class RoomServices {
	
	public ArrayList<Room>getAllRoom(){ 
		try {
			ArrayList<Room>listRm = new ArrayList<Room>();
			
			String query = "SELECT*FROM room";

			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while (rs.next()) {
				Room Rm = new Room();
				
				
				Rm.setRID(rs.getInt("RID"));
				Rm.setName(rs.getString("name"));
				Rm.setType(rs.getString("type"));
				Rm.setChildCapacity(rs.getInt("childCapacity"));
				Rm.setAdultCapacity(rs.getInt("adultCapacity"));
				Rm.setNoOfBeds(rs.getInt("NoOfBeds"));
				Rm.setDescription(rs.getString("description"));
				
				
				listRm.add(Rm);
			}
			
			return listRm;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void deleteRoom(Room Rm) { 
		try {
			String query = "DELETE FROM room WHERE RID = '"+Rm.getRID()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
