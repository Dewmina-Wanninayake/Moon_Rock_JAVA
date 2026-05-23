package model;

import java.sql.Date;

public class PaymentEdit {
	
		int PID;
		double amount;
		Date paidDate;
		String paidMethod;
		int ReserveID;
		
		
		public int getPID() {
			return PID;
		}
		public void setPID(int pID) {
			PID = pID;
		}
		public double getAmount() {
			return amount;
		}
		public void setAmount(double amount) {
			this.amount = amount;
		}
		public Date getPaidDate() {
			return paidDate;
		}
		public void setPaidDate(Date paidDate) {
			this.paidDate = paidDate;
		}
		public String getPaidMethod() {
			return paidMethod;
		}
		public void setPaidMethod(String paidMethod) {
			this.paidMethod = paidMethod;
		}
		public int getReserveID() {
			return ReserveID;
		}
		public void setReserveID(int reserveID) {
			ReserveID = reserveID;
		}
		
		
		
}


