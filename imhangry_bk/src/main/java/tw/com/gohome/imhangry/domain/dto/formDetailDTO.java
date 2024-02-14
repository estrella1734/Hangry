package tw.com.gohome.imhangry.domain.dto;

import lombok.Data;

@Data
public class formDetailDTO {
    private Integer amount;
    private Integer category;
    private Integer productId;
    private Integer productPrice;
    private Integer extraPrice;
    private Integer totalPrice;
    private String[] customizes;
    private String image;
    private String productName;
}
