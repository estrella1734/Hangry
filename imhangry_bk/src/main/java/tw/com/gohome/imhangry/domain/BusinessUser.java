package tw.com.gohome.imhangry.domain;

import org.springframework.data.annotation.CreatedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "business_user")
public class BusinessUser {

    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "fk_brand_id")
    private Integer fkBrandId;

    @Column(name = "name",columnDefinition = "Nvarchar(max)" )
    private String name;

    @Column(name = "password",columnDefinition = "Nvarchar(max)" )
    private String password;

    @Column(name = "phone",columnDefinition = "Nvarchar(max)" )
    private String phone;

    @Column(name = "join_date")
    @CreatedDate
    private String joinDate;

    @Column(name = "operation_time" ,columnDefinition = "Nvarchar(50)")
    private String operationTime;

    @Column(name = "image_index",columnDefinition = "Nvarchar(max)" )
    private String imageIndex;

    @Column(name = "image_icon",columnDefinition = "Nvarchar(max)" )
    private String imageIcon;

    @Column(name = "image_ad",columnDefinition = "Nvarchar(max)" )
    private String imageAd;

    @Column(name = "background_color",columnDefinition = "Nvarchar(50)")
    private String backgroundColor;

    @Column(name = "text_color",columnDefinition = "Nvarchar(50)")
    private String textColor;

    @Column(name = "city", columnDefinition = "Nvarchar(15)")
    private String city;

    @Column(name = "dist", columnDefinition = "Nvarchar(15)")
    private String dist;

    @Column(name = "address", columnDefinition = "Nvarchar(50)")
    private String address;

    @Column(name = "business_type",columnDefinition = "Nvarchar(50)")
    private String businessType;

    @Column(name = "describe", columnDefinition = "Nvarchar(100)")
    private String describe;

    @Column(name = "eng_name",columnDefinition = "Nvarchar(50)")
    private String engName;

    @Column(name="rate")
    private Double rate;

}
