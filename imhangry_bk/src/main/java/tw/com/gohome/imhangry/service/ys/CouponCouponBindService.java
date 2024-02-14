package tw.com.gohome.imhangry.service.ys;

import java.util.List;

import tw.com.gohome.imhangry.domain.dto.CouponCouponBindDTO;

public interface CouponCouponBindService {
    public List<CouponCouponBindDTO> getCoupon(Integer fkGuestId);

}
