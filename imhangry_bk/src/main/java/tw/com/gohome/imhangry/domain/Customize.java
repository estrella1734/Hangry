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
@Table(name = "customize")
public class Customize {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    
    @Column(name = "fk_category_id" )
    private Integer fkCategoryId;
    @Column(name = "cust_cate_name" ,columnDefinition = "Nvarchar(max)" )
    private String custCateName;
  

}
