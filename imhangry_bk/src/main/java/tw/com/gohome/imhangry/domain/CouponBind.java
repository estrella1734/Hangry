package tw.com.gohome.imhangry.domain;

import java.util.Date;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
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
@Table(name = "coupon_bind")
@EntityListeners(AuditingEntityListener.class)
public class CouponBind {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "code", columnDefinition = "varchar")
    private String code;
    @Column(name = "fk_coupon_id")
    private Integer fkCouponId;
    @Column(name = "fk_guest_id")
    private Integer fkGuestId;
    @CreatedDate
    @Column(name = "create_date", columnDefinition = "datetime2")
    private Date createDate;
    @Column(name = "used")
    private Integer used;
    @LastModifiedBy
    @Column(name = "used_date", columnDefinition = "datetime2")
    private Date usedDate;

}
