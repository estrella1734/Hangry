package tw.com.gohome.imhangry.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BrandResultDTO {

    private Integer id;
    private String name;
    private String operationTime;
    private Double rate;
    private String address;
    private String imageIcon;
    private String dist;
    private String city;
}
