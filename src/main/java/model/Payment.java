package model;

import java.time.LocalDate;

public class Payment {
    private double amount;
    private LocalDate paidDate;
    private String paidMethod;
    private int reserveId;

    
    public Payment() {
    	this.amount= 0.00;
    	this.paidDate=LocalDate.now();
    	this.paidMethod="Select a method";
    	this.reserveId= 0;
    }

    
    public Payment(double amount, LocalDate paidDate, String paidMethod, int reserveId) {
        this.amount = amount;
        this.paidDate = paidDate;
        this.paidMethod = paidMethod;
        this.reserveId = reserveId;
    }


	public double getAmount() {
		return amount;
	}


	public void setAmount(double amount) {
		this.amount = amount;
	}


	public LocalDate getPaidDate() {
		return paidDate;
	}


	public void setPaidDate(LocalDate paidDate) {
		this.paidDate = paidDate;
	}


	public String getPaidMethod() {
		return paidMethod;
	}


	public void setPaidMethod(String paidMethod) {
		this.paidMethod = paidMethod;
	}


	public int getReserveId() {
		return reserveId;
	}


	public void setReserveId(int reserveId) {
		this.reserveId = reserveId;
	}

}
