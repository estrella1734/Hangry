package tw.com.gohome.imhangry.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "credit_card")
public class CreditCard {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "fk_guest_id")
    private Integer fkGuestId;

    @Column(name = "credit_card_no")
    private Long creditCardNo;

    @Column(name = "name", columnDefinition = "Nvarchar(30)")
    private String name;

    @Column(name = "default_card")
    private Integer defaultCard;
}
