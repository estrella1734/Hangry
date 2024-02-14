package tw.com.gohome.imhangry.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.gohome.imhangry.domain.GuestAddress;
import tw.com.gohome.imhangry.repository.declaredinterfaces.GuestAddressRepositoryCustom;
import java.util.List;


public interface GuestAddressRepository extends JpaRepository<GuestAddress, Integer>, GuestAddressRepositoryCustom {

    List<GuestAddress> findByFkGuestId(Integer fkGuestId);

}
