package model;

import java.time.LocalDate;

public class Reservation {
    private int reserveID;
    private int uid;
    private int rid;
    private int serviceID;
    private LocalDate startDate;
    private LocalDate endDate;
    private double price;

    
    public Reservation() {
    	
    }

    public Reservation(int reserveID, int uid, int rid, int serviceID, LocalDate startDate, LocalDate endDate, double price) {
        this.reserveID = reserveID;
        this.uid = uid;
        this.rid = rid;
        this.serviceID = serviceID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.price = price;
    }

	public int getReserveID() {
		return reserveID;
	}

	public void setReserveID(int reserveID) {
		this.reserveID = reserveID;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getServiceID() {
		return serviceID;
	}

	public void setServiceID(int serviceID) {
		this.serviceID = serviceID;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

    
}
