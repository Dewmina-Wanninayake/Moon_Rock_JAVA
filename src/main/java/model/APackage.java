package model;



import java.math.BigDecimal;
import java.sql.Date;

public class APackage {
    private int serviceID;
    private String serviceName;
    private String serviceType;
    private boolean availability;
    private BigDecimal price;
    private BigDecimal discount;
    private Date dateAdded;
    private String description;
    private String image;

    // Constructors
    public APackage() {
    }

    public APackage(int serviceID, String serviceName, String serviceType, boolean availability,
                    BigDecimal price, BigDecimal discount, Date dateAdded, String description, String image) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.serviceType = serviceType;
        this.availability = availability;
        this.price = price;
        this.discount = discount;
        this.dateAdded = dateAdded;
        this.description = description;
        this.image = image;
    }

    // Getters and Setters
    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean i) {
        this.availability = i;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public Date getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
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

    @Override
    public String toString() {
        return "APackage{" +
                "serviceID=" + serviceID +
                ", serviceName='" + serviceName + '\'' +
                ", serviceType='" + serviceType + '\'' +
                ", availability=" + availability +
                ", price=" + price +
                ", discount=" + discount +
                ", dateAdded=" + dateAdded +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
     
    
 

