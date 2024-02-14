package tw.com.gohome.imhangry.domain;

import java.util.Date;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "coupon")
@EntityListeners(AuditingEntityListener.class)
public class Coupon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "title", columnDefinition = "nvarchar(30)")
    private String title;
    @Column(name = "discount")
    private Integer discount;
    @Column(name = "threshold")
    private Integer threshold;
    @Column(name = "description", columnDefinition = "nvarchar(100)")
    private String description;
    @CreatedDate
    @Column(name = "create_date", columnDefinition = "datetime2")
    private Date createDate;
    @Column(name = "start_date", columnDefinition = "datetime2")
    private Date startDate;
    @Column(name = "end_date", columnDefinition = "datetime2")
    private Date endDate;
    @Column(name = "amount")
    private Integer amount;

}
