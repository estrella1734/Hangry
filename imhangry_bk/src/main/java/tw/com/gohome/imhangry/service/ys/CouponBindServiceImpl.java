package tw.com.gohome.imhangry.service.ys;

import java.util.Date;

import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import tw.com.gohome.imhangry.domain.CouponBind;
import tw.com.gohome.imhangry.repository.CouponBindRepository;

@Service
@Transactional
public class CouponBindServiceImpl implements CouponBindService {
    @Resource
    CouponBindRepository couponBindRepository;

    @Override
    public String getCode() {

        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 1; i <= 8; i++) {
            stringBuilder.append(chars.charAt((int) (Math.random() * 62)));
        }

        return stringBuilder.toString();
    }

    @Override
    public void addCouponBind(Integer couponId, Integer fkGuestId, String couponCode) {
        // 檢查是否存在相同的fkGuestId且fkCouponId等於傳入值
        if (couponBindRepository.existsByFkCouponIdAndFkGuestId(couponId, fkGuestId)) {
            // 如果存在，可以拋出異常或執行其他適當的操作
            throw new RuntimeException(
                    "CouponBind with fkCouponId " + couponId + " and fkGuestId " + fkGuestId + " already exists.");
        }

        CouponBind couponBind = new CouponBind();
        couponBind.setFkCouponId(couponId);
        couponBind.setFkGuestId(fkGuestId);
        couponBind.setCode(couponCode);
        couponBind.setUsed(0); // 初始設置為未使用
        couponBind.setCreateDate(new Date());

        couponBindRepository.save(couponBind);
    }

}
