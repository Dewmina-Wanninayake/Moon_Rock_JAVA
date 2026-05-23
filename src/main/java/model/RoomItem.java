package model;

public class RoomItem extends ViewedItem {
    public RoomItem(int id, String description, String image, String dateRange, double price, boolean isModified) {
        super(id, description, image, dateRange, price, isModified);
    }
    
    @Override
    public String getType() { return "room"; }
}

