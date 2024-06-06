package entity;

public class Supplier {
    private int supid;
    private String supname;
    private String supphone;
    private String supemail;
    private String supaddress;
    private int cateid;

    // Constructors
    public Supplier() {
    }

    public Supplier(int supid, String supname, String supphone, String supemail, String supaddress, int cateid) {
        this.supid = supid;
        this.supname = supname;
        this.supphone = supphone;
        this.supemail = supemail;
        this.supaddress = supaddress;
        this.cateid = cateid;
    }

    // Getter and Setter methods
    public int getSupid() {
        return supid;
    }

    public void setSupid(int supid) {
        this.supid = supid;
    }

    public String getSupname() {
        return supname;
    }

    public void setSupname(String supname) {
        this.supname = supname;
    }

    public String getSupphone() {
        return supphone;
    }

    public void setSupphone(String supphone) {
        this.supphone = supphone;
    }

    public String getSupemail() {
        return supemail;
    }

    public void setSupemail(String supemail) {
        this.supemail = supemail;
    }

    public String getSupaddress() {
        return supaddress;
    }

    public void setSupaddress(String supaddress) {
        this.supaddress = supaddress;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    // Override toString() method for debugging purposes
    @Override
    public String toString() {
        return "Supplier{" +
                "supid=" + supid +
                ", supname='" + supname + '\'' +
                ", supphone='" + supphone + '\'' +
                ", supemail='" + supemail + '\'' +
                ", supaddress='" + supaddress + '\'' +
                ", cateid=" + cateid +
                '}';
    }
}

