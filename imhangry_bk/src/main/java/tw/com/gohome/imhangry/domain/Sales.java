package tw.com.gohome.imhangry.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name="sales")
public class Sales {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "start_date")
    private Date starDate;
    @Column(name = "end_date")
    private Date endDate;
    @Column(name="discount",columnDefinition = "Nvarchar(max)" )
    private String discount;

    @Column(name = "fk_category_id")
    private Integer fkCategoryId;
}
