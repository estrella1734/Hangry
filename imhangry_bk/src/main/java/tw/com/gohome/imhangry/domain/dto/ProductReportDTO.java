package tw.com.gohome.imhangry.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // 包含setter、getter、toString
@AllArgsConstructor // 全參建構子
@NoArgsConstructor // 無參建構子
public class ProductReportDTO {

    private Integer productId;

    private String productName;

    private Integer categoryId;

    private Integer price;

    private Integer amount;

    private java.util.Date time;

}
