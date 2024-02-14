package tw.com.gohome.imhangry.service.ys;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import tw.com.gohome.imhangry.domain.Coupon;

public interface CouponService {
    Coupon saveCoupon(Coupon cp);

    List<Coupon> getCoupons();

    void updateCouponAmount(Integer couponId);

    List<Integer> getAllCouponIds();

    public void rollbackCouponAmountUpdate(Integer couponId);

    void saveCouponsFromCsv(InputStream inputStream) throws IOException;

    LocalDateTime parseDateTime(String dateTimeString);

}
