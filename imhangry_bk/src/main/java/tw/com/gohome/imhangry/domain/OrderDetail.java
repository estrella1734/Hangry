package tw.com.gohome.imhangry.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "order_detail")
public class OrderDetail {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "amount" )
    private Integer amount;

    @Column(name = "name" ,columnDefinition = "Nvarchar(max)" )
    private String name;

    @Column(name = "price" )
    private Integer price;

    @Column(name = "image",columnDefinition = "Nvarchar(max)" )
    private String image;

    @Column(name = "describe", columnDefinition = "Nvarchar(100)")
    private String describe;

    @Column(name = "category" )
    private Integer category;

    @Column(name = "product_total" )
    private Integer productTotal;

    @Column(name = "fk_order_id")
    private Integer fkOrderId;

    @Column(name = "fk_product_id")
    private Integer fkProductId;

}
