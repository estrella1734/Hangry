package tw.com.gohome.imhangry.service.gkd;

import java.util.List;

import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.gohome.imhangry.domain.dto.ProductQuickViewDTO;
import tw.com.gohome.imhangry.domain.dto.ProductReportDTO;

@SpringBootTest
public class ProductAjaxServiceTest {

    @Autowired
    private ProductAjaxService productAjaxService;

    @Test
    public void testFindProductReportByBuIdAndDate(){
        JSONObject json = new JSONObject()
        .put("buId", 1)
        .put("startDate", "2024-01-01")
        .put("endDate", "2024-02-28");

        List<ProductReportDTO> result = productAjaxService.findProductReportByBuIdAndDate(json.toString());

        System.err.println(result);
    }

    @Test
    public void testFindProductQVByFkBusinessIdAndDate(){
        JSONObject json = new JSONObject()
        .put("buId", 1)
        .put("startDate", "2024-01-01")
        .put("endDate", "2024-01-31");

        List<ProductQuickViewDTO> result = productAjaxService.findProductQVByFkBusinessIdAndDate(json.toString());

        System.err.println(result);
    }
    
}
