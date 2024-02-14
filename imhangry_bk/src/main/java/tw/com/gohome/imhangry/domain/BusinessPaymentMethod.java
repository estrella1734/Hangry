package tw.com.gohome.imhangry.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name="business_payment_method")
@IdClass(BusinessPayMethodPkConfig.class)
public class BusinessPaymentMethod {

    @Id
    @Column(name="fk_business_id")
    private Integer fkBusinessId;
    @Id
    @Column(name = "fk_payment_method")
    private Integer fkPaymentMethodId;
}
