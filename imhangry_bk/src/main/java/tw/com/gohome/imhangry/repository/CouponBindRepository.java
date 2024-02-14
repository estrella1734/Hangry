package tw.com.gohome.imhangry.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.gohome.imhangry.domain.CouponBind;
import tw.com.gohome.imhangry.repository.declaredinterfaces.CouponBindRepositoryCustom;

public interface CouponBindRepository extends JpaRepository<CouponBind, Integer>, CouponBindRepositoryCustom {

    List<CouponBind> findByfkGuestId(Integer fkGuestId);

    boolean existsByFkGuestId(Integer fkGuestId);

    List<CouponBind> findByFkCouponId(Integer fkCouponId);

    boolean existsByFkCouponIdAndFkGuestId(Integer fkCouponId, Integer fkGuestId);

}
