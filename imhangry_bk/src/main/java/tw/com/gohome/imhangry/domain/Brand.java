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
@Table(name = "brand")
public class Brand {



    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name" ,columnDefinition = "Nvarchar(max)"  )
    private String name;

    @Column(name = "image",columnDefinition = "Nvarchar(max)" )
    private String image;

    @Column(name = "eng_name",columnDefinition = "Nvarchar(max)" )
    private String engName;
}
