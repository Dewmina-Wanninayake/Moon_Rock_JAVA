package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.ReservationEdit;

import utils.DBconnect;

public class ReservationServices {
	
	public ArrayList<ReservationEdit>getAllReservationEdit(){ 
		try {
			ArrayList<ReservationEdit>listRe = new ArrayList<ReservationEdit>();
			
			String query = "SELECT*FROM reservation";

			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while (rs.next()) {
				ReservationEdit Re = new ReservationEdit();
				
				
				
				Re.setReserveID(rs.getInt("ReserveID"));
				Re.setUID(rs.getInt("UID"));
				Re.setRID(rs.getInt("RID"));
				Re.setServiceID(rs.getInt("ServiceID"));
				Re.setStartDate(rs.getDate("StartDate"));
				Re.setEndDate(rs.getDate("EndDate"));
				Re.setPrice(rs.getDouble("Price"));
				
				
				
				listRe.add(Re);
			}
			
			return listRe;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void deleteReservatione(ReservationEdit Re) { 
		try {
			String query = "Delete from reservation where ReserveID = '"+Re.getReserveID()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
