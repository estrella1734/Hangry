package tw.com.gohome.imhangry.controller.ys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.service.ys.CouponBindService;
import tw.com.gohome.imhangry.service.ys.CouponService;

@RestController
@RequestMapping("/coupon")
@CrossOrigin
public class CouponBindController {
    @Autowired
    CouponService couponService;
    @Autowired
    CouponBindService couponBindService;

    @PostMapping("/receive/{couponId}/{fkGuestId}")
    public ResponseEntity<String> receiveCoupon(@PathVariable Integer couponId, @PathVariable Integer fkGuestId) {
        try {

            // 第一步：調用CouponService中的getCode方法獲取優惠碼
            String couponCode = couponBindService.getCode();
            System.err.println("couponCode=" + couponCode);

            // 第二步：調用CouponBindService中的新增CouponBind方法
            couponBindService.addCouponBind(couponId, fkGuestId, couponCode);

            // 第三步：調用CouponService中的更新CouponAmount方法
            couponService.updateCouponAmount(couponId);

            return ResponseEntity.ok("Coupon received successfully");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error receiving coupon: " + e.getMessage());
        }
    }

    @PostMapping("/receive/all/{fkGuestId}")
    public ResponseEntity<String> receiveAllCoupons(@PathVariable Integer fkGuestId) {
        try {
            List<Integer> allCouponIds = couponService.getAllCouponIds(); // 假設有一個方法可以獲取所有優惠券的 ID 列表
            int receivedCount = 0;

            for (Integer couponId : allCouponIds) {
                try {
                    // 調用CouponService中的更新CouponAmount方法
                    couponService.updateCouponAmount(couponId);

                    // 調用CouponService中的getCode方法獲取優惠碼
                    String couponCode = couponBindService.getCode();
                    System.err.println("couponCode=" + couponCode);

                    // 調用CouponBindService中的新增CouponBind方法
                    couponBindService.addCouponBind(couponId, fkGuestId, couponCode);

                    receivedCount++;
                } catch (Exception e) {
                    // 可以在這裡處理單個優惠券領取失敗的情況，例如記錄日誌
                    e.printStackTrace();
                    // 如果領取失敗，可以將前面的更新操作撤銷，避免影響優惠券數量
                    couponService.rollbackCouponAmountUpdate(couponId);
                }
            }

            return ResponseEntity.ok(receivedCount + "張");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error receiving coupons: " + e.getMessage());
        }
    }

}
