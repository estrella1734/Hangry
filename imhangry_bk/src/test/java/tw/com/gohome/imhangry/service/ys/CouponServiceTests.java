package tw.com.gohome.imhangry.service.ys;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.gohome.imhangry.domain.Coupon;

@SpringBootTest
public class CouponServiceTests {
    @Autowired
    private CouponService couponService;
    @Autowired
    private CouponBindService couponBindService;

    @Test
    public void saveCoupon() {
        Coupon coupon = new Coupon();
        coupon.setAmount(500);
        coupon.setDiscount(90);
        java.util.Date startDate = new java.util.Date();
        startDate.setTime(1000);
        coupon.setStartDate(startDate);
        java.util.Date endDate = new java.util.Date();
        endDate.setTime(2000);
        coupon.setEndDate(endDate);

        couponService.saveCoupon(coupon);

    }

    @Test
    public void getCode() {
        System.err.println(couponBindService.getCode());
    }

}
