package tw.com.gohome.imhangry.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "revenue")
public class Revenue {

    @Id
    @Column(name = "id")
    private Integer id;

    @Column(name = "revenue")
    private Integer revenue;

    @Column(name = "date")
    private java.util.Date date;



    
    @Override
    public String toString() {
        return "RevenueBean [id=" + id + ", revenue=" + revenue + ", date=" + date + "]";
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRevenue() {
        return revenue;
    }

    public void setRevenue(Integer revenue) {
        this.revenue = revenue;
    }

    public java.util.Date getDate() {
        return date;
    }

    public void setDate(java.util.Date date) {
        this.date = date;
    }
}
