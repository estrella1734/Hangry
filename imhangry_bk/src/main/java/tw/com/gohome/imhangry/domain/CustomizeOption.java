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
@Table(name = "customize_option")
public class CustomizeOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    
    @Column(name = "fk_customize_id")
    private Integer fkCustomizeId;
    @Column(name = "cust_option_name",columnDefinition = "Nvarchar(max)"  )
    private String custOptionName;
    @Column(name = "extra_price" )
    private Integer extraPrice;

}
