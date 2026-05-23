package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.PaymentEdit;

import utils.DBconnect;

public class PaymentServices {
	
	
	public ArrayList<PaymentEdit>getAllPaymentEdit(){ /*read admin*/
		try {
			ArrayList<PaymentEdit>listPa = new ArrayList<PaymentEdit>();
			
			String query = "SELECT*FROM payment";

			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while (rs.next()) {
				PaymentEdit Pa = new PaymentEdit();
				
				
				
				Pa.setPID(rs.getInt("PID"));
				Pa.setAmount(rs.getDouble("amount"));
				Pa.setPaidDate(rs.getDate("paidDate"));
				Pa.setPaidMethod(rs.getString("paidMethod"));
				Pa.setReserveID(rs.getInt("ReserveID"));
				
				
				
				listPa.add(Pa);
			}
			
			return listPa;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
