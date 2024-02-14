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
@Table(name = "product")
public class Product {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "fk_category_id")
    private Integer fkCategoryId;
    @Column(name = "fk_business_id")
    private Integer fkBusinessId;
    @Column(name = "name", columnDefinition = "nvarchar(30)")
    private String name;
    @Column(name = "eng_name", columnDefinition = "nvarchar(30)")
    private String engName;
    @Column(name = "price")
    private Integer price;
    @Column(name = "status")
    private Integer status;
    @Column(name = "description", columnDefinition = "nvarchar(100)")
    private String description;
    @Column(name = "image",columnDefinition = "Nvarchar(max)" )
    private String image;

}
