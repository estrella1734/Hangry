package tw.com.gohome.imhangry.service.ys;

public interface CouponBindService {
    String getCode();

    void addCouponBind(Integer couponId, Integer fkGuestId, String couponCode);

}
