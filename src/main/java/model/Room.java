package model;

public class Room {
	
	private int RID;
	private String name;
	private String type;
	private int childCapacity;
	private int adultCapacity;
	private int NoOfBeds;
	private String description;
	
	
	public int getRID() {
		return RID;
	}
	public void setRID(int rID) {
		RID = rID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getChildCapacity() {
		return childCapacity;
	}
	public void setChildCapacity(int childCapacity) {
		this.childCapacity = childCapacity;
	}
	public int getAdultCapacity() {
		return adultCapacity;
	}
	public void setAdultCapacity(int adultCapacity) {
		this.adultCapacity = adultCapacity;
	}
	public int getNoOfBeds() {
		return NoOfBeds;
	}
	public void setNoOfBeds(int noOfBeds) {
		NoOfBeds = noOfBeds;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	

}
