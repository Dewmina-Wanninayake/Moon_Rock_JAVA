package model;

public class ServiceItem extends ViewedItem {
    public ServiceItem(int id, String description, String image, String dateRange, double price, boolean isModified) {
        super(id, description, image, dateRange, price, isModified);
    }
    
    @Override
    public String getType() { return "service"; }
}

