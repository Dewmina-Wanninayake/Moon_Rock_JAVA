package model;

/*factory pattern*/

public abstract class ViewedItem {
    protected int id;
    protected String description;
    protected String image;
    protected String dateRange;
    protected double price;
    protected boolean isModified;

    public ViewedItem(int id, String description, String image, String dateRange, double price, boolean isModified) {
        this.id = id;
        this.description = description;
        this.image = image;
        this.dateRange = dateRange;
        this.price = price;
        this.isModified = isModified;
    }

    public abstract String getType();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDateRange() {
		return dateRange;
	}

	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isModified() {
		return isModified;
	}

	public void setModified(boolean isModified) {
		this.isModified = isModified;
	}

}

