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
@Table(name = "guest_user")
public class GuestUser {

        @Id
        @Column(name = "id")
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Integer id;

        @Column(name = "google_id")
        private Integer googleId;

        @Column(name = "name", columnDefinition = "Nvarchar(30)")
        private String name;

        @Column(name = "nickname", columnDefinition = "Nvarchar(30)", nullable = true)
        private String nickname;

        @Column(name = "phone")
        private String phone;

        @Column(name = "gender")
        private boolean gender;

        @Column(name = "birthday",columnDefinition = "Nvarchar(max)" )
        private String birthday;

        @Column(name = "email",columnDefinition = "Nvarchar(max)" )
        private String email;

        // @ManyToOne
        // @JoinColumn(name = "fk_address_id", nullable = true)
        // private GuestAddress addressId;

        @Column(name = "password",columnDefinition = "Nvarchar(max)" )
        private String password;

        @Column(name = "invoice", nullable = true,columnDefinition = "Nvarchar(max)" )
        private String invoice;

        @Column(name = "join_date",columnDefinition = "Nvarchar(max)" )
        private String joinDate;

        @Column(name = "image",columnDefinition = "Nvarchar(max)" )
        private String image;

        @Column(name = "tax_number", nullable = true,columnDefinition = "Nvarchar(max)" )
        private String taxNumber;

}
