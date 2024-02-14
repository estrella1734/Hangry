package tw.com.gohome.imhangry.service.bird;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.gohome.imhangry.domain.CouponBind;
import tw.com.gohome.imhangry.domain.dto.CouponsDTO;
import tw.com.gohome.imhangry.repository.CouponBindRepository;
import tw.com.gohome.imhangry.repository.CouponRepository;

@Service
@Transactional
public class CouponService1 {
    @Autowired
    private CouponRepository couponRepository;
    @Autowired
    private CouponBindRepository couponBindRepository;

    public List<CouponsDTO> searchCoupons(Integer id){
        return id == null? null : couponRepository.getCouponsByUserId(id);
    }

    public Boolean deleteByCouponId(Integer id){
        if(id ==null){
            return false;
        }
        List<CouponBind> list = couponBindRepository.findByFkCouponId(id);
        if(list != null && !list.isEmpty()){
            CouponBind couponBind = list.get(0);
            if(couponBind != null &&couponBind.getId()!= null)
            couponBindRepository.delete(couponBind);
            return true;
        }
        return false;
    }


}
