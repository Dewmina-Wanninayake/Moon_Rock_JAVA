package services;

import java.sql.*;
import model.Payment;
import utils.DBconnect;

public class PaymentDB {

	public boolean addPayment(Payment payment) {
	    try {
	        String query = "INSERT INTO payment (amount, paidDate, paidMethod, ReserveID) VALUES ('"
	                + payment.getAmount() + "','"
	                + payment.getPaidDate() + "','"
	                + payment.getPaidMethod() + "','"
	                + payment.getReserveId() + "')";

	        Statement statement = DBconnect.getConnection().createStatement();
	        int rowsAffected = statement.executeUpdate(query);

	        return rowsAffected > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}
