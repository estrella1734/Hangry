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
@Table(name = "guest_address")
public class GuestAddress {
    // @OneToMany(mappedBy = "addressId", cascade = { CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
    // private Set<GuestUser> guestUsers;

    @Id
    @Column(name = "id" )
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    
    @Column(name = "fk_guest_id" )
    private Integer fkGuestId;

    @Column(name = "city" , columnDefinition = "Nvarchar(30)")
    private String city;

    @Column(name = "dist" , columnDefinition = "Nvarchar(30)")
    private String dist;

    @Column(name = "address" , columnDefinition = "Nvarchar(100)")
    private String address;

}
