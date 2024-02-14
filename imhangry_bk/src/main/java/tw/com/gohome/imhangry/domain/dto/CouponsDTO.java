package tw.com.gohome.imhangry.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CouponsDTO {
    private Long count;
    private Integer id;
    private Integer discount;
    private Integer threshold;
}
