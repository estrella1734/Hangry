package tw.com.gohome.imhangry.domain;

import lombok.Data;

@Data
public class BusinessPayMethodPkConfig {
    private Integer fkBusinessId;
    private Integer fkPaymentMethodId;
}
