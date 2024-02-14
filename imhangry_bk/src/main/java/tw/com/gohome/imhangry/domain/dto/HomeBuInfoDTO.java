package tw.com.gohome.imhangry.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // 包含setter、getter、toString
@AllArgsConstructor // 全參建構子
@NoArgsConstructor // 無參建構子
public class HomeBuInfoDTO {

    private String name;

    private Double rate;

    private String address;

    private String describe;

    private String imageIcon;

    private String imageIndex;

    private String operationTime;

    private String phone;

}
