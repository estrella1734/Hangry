package tw.com.gohome.imhangry.service.ys;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import tw.com.gohome.imhangry.domain.dto.CouponCouponBindDTO;
import tw.com.gohome.imhangry.repository.CouponBindRepository;
import tw.com.gohome.imhangry.repository.CouponRepository;

@Service
@Transactional
public class CouponCouponBindServiceImpl implements CouponCouponBindService {
    @Resource
    private CouponRepository couponRepository;
    @Resource
    private CouponBindRepository couponBindRepository;

    @Override
    public List<CouponCouponBindDTO> getCoupon(Integer fkGuestId) {

        return couponRepository.getCouponByFkGuestId(fkGuestId);

    }

}
