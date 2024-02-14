package tw.com.gohome.imhangry.controller.ys;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import tw.com.gohome.imhangry.domain.Coupon;
import tw.com.gohome.imhangry.domain.dto.CouponCouponBindDTO;
import tw.com.gohome.imhangry.service.ys.CouponCouponBindService;
import tw.com.gohome.imhangry.service.ys.CouponService;

@RestController
@RequestMapping("/coupon")
@CrossOrigin
public class CouponController {
    @Autowired
    CouponService couponService;
    @Autowired
    CouponCouponBindService couponCouponBindService;

    @PostMapping("/upload")
    public ResponseEntity<Coupon> createCoupon(@RequestBody Coupon coupon) {
        Coupon savedCoupon = couponService.saveCoupon(coupon);
        if (savedCoupon != null) {
            return new ResponseEntity<>(savedCoupon, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT); // 表示資源已存在
        }
    }

    @GetMapping("/myCoupon/{guId}")
    public ResponseEntity<?> getCoupon(@PathVariable(name = "guId") Integer guId) {
        if (guId != null) {
            List<CouponCouponBindDTO> couponDetail = couponCouponBindService.getCoupon(guId);
            return ResponseEntity.ok().body(couponDetail);
        }
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/platform")
    public ResponseEntity<List<Coupon>> getCoupons() {
        List<Coupon> couponList = couponService.getCoupons();
        return ResponseEntity.status(HttpStatus.OK).body(couponList);
    }

    @PostMapping("/upload/file")
    public ResponseEntity<String> uploadCsvFile(@RequestParam("file") MultipartFile file) {
        try {
            couponService.saveCouponsFromCsv(file.getInputStream());
            return ResponseEntity.status(HttpStatus.OK).body("CSV file uploaded successfully!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error during CSV file upload!");
        }
    }

}
