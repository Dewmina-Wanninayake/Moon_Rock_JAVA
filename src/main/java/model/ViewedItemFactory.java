package model;

public class ViewedItemFactory {
    public static ViewedItem createViewedItem(String type, int id, String description, String image, String dateRange, double price, boolean isModified) {
        
    	switch (type.toLowerCase()) {
            case "room":
                return new RoomItem(id, description, image, dateRange, price, isModified);
            case "service":
                return new ServiceItem(id, description, image, dateRange, price, isModified);
            default:
                throw new IllegalArgumentException("Unknown item type: " + type);
        }
    }
}

