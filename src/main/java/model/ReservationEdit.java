package model;

import java.sql.Date;

public class ReservationEdit {
	private int ReserveID;
	private int UID;
	private int RID;
	private int ServiceID;
	private Date StartDate;
	private Date EndDate;
	private double Price;
	
	
	public int getReserveID() {
		return ReserveID;
	}
	public void setReserveID(int reserveID) {
		ReserveID = reserveID;
	}
	public int getUID() {
		return UID;
	}
	public void setUID(int uID) {
		UID = uID;
	}
	public int getRID() {
		return RID;
	}
	public void setRID(int rID) {
		RID = rID;
	}
	public int getServiceID() {
		return ServiceID;
	}
	public void setServiceID(int serviceID) {
		ServiceID = serviceID;
	}
	public Date getStartDate() {
		return StartDate;
	}
	public void setStartDate(Date startDate) {
		StartDate = startDate;
	}
	public Date getEndDate() {
		return EndDate;
	}
	public void setEndDate(Date endDate) {
		EndDate = endDate;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	
	
}
