package tw.com.gohome.imhangry.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BusinessUserOrderPageDTO {
    
    private Integer id;
    private String name;
    private String brandName;
    private String time;
    private String phone;
    private String city;
    private String dist;
    private String address;
    private Double rate;


}
