package tw.com.gohome.imhangry.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderManagerDTO {

    private Integer id;

    private String address;

    private String paymentType;

    private Integer fkProductId;

    private Integer amount;

    private Integer price;

    private String image;

    private String name;

}
