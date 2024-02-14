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
@Table(name = "order_form")
@EntityListeners(AuditingEntityListener.class)
//啟用了審計功能，使用 Spring Data JPA 提供的 AuditingEntityListener 來處理審計事件，用於自動寫入時間。
public class OrderForm {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)    
    private Integer id;


    @Column(name = "fk_guest_id")
    private Integer fkGuestId;

    
    @Column(name = "fk_business_id")
    private Integer fkBusinessId;

    @CreatedDate
    private Date time;

    @Column(name = "total")
    private Integer total;

    @Column(name = "payment_status")
    private Integer paymentStatus;

    @Column(name = "pickup",columnDefinition = "Nvarchar(max)" )
    private String pickup;

    @Column(name = "payment_type",columnDefinition = "Nvarchar(max)" )
    private String paymentType;

    @Column(name = "text", columnDefinition = "Nvarchar(50)")
    private String text;

    @Column(name = "coupon_id")
    private Integer couponId;

    @Column(name = "address", columnDefinition = "Nvarchar(100)")
    private String address;

}
