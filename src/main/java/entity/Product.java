package entity;

public class Product {
    private int id;
    private String name;
    private String image;
    private double price;
    private String title;
    private String description;
    private int cateID;
    private int suppid;
    private String properties;
    private String image2;
    private String image3;

    // Constructors
    public Product() {
    }

    public Product(int id, String name, String image, double price, String title, String description, int cateID, int suppid, String properties, String image2, String image3) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateID = cateID;
        this.suppid = suppid;
        this.properties = properties;
        this.image2 = image2;
        this.image3 = image3;
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public int getSuppid() {
        return suppid;
    }

    public void setSuppid(int suppid) {
        this.suppid = suppid;
    }

    public String getProperties() {
        return properties;
    }

    public void setProperties(String properties) {
        this.properties = properties;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    // Override toString() method for debugging purposes
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", cateID=" + cateID +
                ", suppid=" + suppid +
                ", properties='" + properties + '\'' +
                ", image2='" + image2 + '\'' +
                ", image3='" + image3 + '\'' +
                '}';
    }
}

