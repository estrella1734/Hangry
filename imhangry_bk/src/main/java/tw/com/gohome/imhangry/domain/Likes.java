package tw.com.gohome.imhangry.domain;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name="likes")
@IdClass(LikesPkConfig.class)
public class Likes{

    @Id
    @Column(name = "fk_business_id")
    private Integer fkBusinessId;
    
    @Id
    @Column(name = "fk_guest_id")
    private Integer fkGuestId;
}

