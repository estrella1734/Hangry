package tw.com.gohome.imhangry.domain.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CouponCouponBindDTO {
    private Integer couponBindFkGuestId;
    private Integer couponBindUsed;
    private String couponBindCode;
    private Integer couponDiscount;
    private Date couponStartDate;
    private Date couponEndDate;

    private Integer couponThreshold;
    private String couponDescription;
    private String couponTitle;

}
