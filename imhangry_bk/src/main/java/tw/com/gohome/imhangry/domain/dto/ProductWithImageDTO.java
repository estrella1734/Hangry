package tw.com.gohome.imhangry.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductWithImageDTO {
    private String name;
    private String engName;
    private Integer fkCategoryId;
    private Integer price;
    private Integer status;
    private String description;
    private String base64Image;
}
