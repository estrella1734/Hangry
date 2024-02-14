package tw.com.gohome.imhangry.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.gohome.imhangry.domain.Coupon;
import tw.com.gohome.imhangry.domain.dto.CouponCouponBindDTO;
import tw.com.gohome.imhangry.domain.dto.CouponsDTO;
import tw.com.gohome.imhangry.repository.declaredinterfaces.CouponRepositoryCustom;

public interface CouponRepository extends JpaRepository<Coupon, Integer>, CouponRepositoryCustom {

    @Query("""
            SELECT new tw.com.gohome.imhangry.domain.dto.CouponCouponBindDTO(cb.fkGuestId couponBindFkGuestId,cb.used couponBindUsed,cb.code couponBindCode,c.discount couponDiscount,c.startDate couponStartDate,c.endDate couponEndDate,c.title couponTitle, c.threshold couponThreshold, c.description couponDescription)FROM Coupon c join CouponBind cb on c.id=cb.fkCouponId where fkGuestId=:id order by endDate
                    """)
    List<CouponCouponBindDTO> getCouponByFkGuestId(Integer id);

    @Query(value = "SELECT * FROM Coupon", nativeQuery = true)
    List<Coupon> getCoupons();

    @Query("""
            select new tw.com.gohome.imhangry.domain.dto.CouponsDTO(count(c) count,c.id,discount,threshold) from Coupon c
            join CouponBind cb on c.id = cb.fkCouponId
            where fkGuestId = :id and used = 0
            group by c.id,discount,threshold
            """)
    List<CouponsDTO> getCouponsByUserId(Integer id);

    @Query("SELECT c.id FROM Coupon c")
    List<Integer> getAllCouponIds();
}
