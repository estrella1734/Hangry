package tw.com.gohome.imhangry.controller.gkd;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.domain.dto.ProductQuickViewDTO;
import tw.com.gohome.imhangry.domain.dto.ProductReportDTO;
import tw.com.gohome.imhangry.service.gkd.ProductAjaxService;

@RestController
@RequestMapping("/pages/rest")
@CrossOrigin
public class ProductRestController {

    @Autowired
    private ProductAjaxService productAjaxService;

    @PostMapping("/product/findProductByBuIdAndDate")
    public ResponseEntity<?> findProductByBuIdAndDate(@RequestBody String body) {
        JSONObject obj = new JSONObject(body);
        Integer tempBuId = null;
        String tempStartDate = null;
        String tempEndDate = null;

        if (!obj.isNull("buId")) {
            tempBuId = obj.getInt("buId");
        }

        if (!obj.isNull("startDate")) {
            tempStartDate = obj.getString("startDate");
        }
        if (!obj.isNull("endDate")) {
            tempEndDate = obj.getString("endDate");
        }

        if (tempBuId == null || tempStartDate == null || tempEndDate == null) {
            ResponseEntity<Void> entiry = ResponseEntity.noContent().build();
            return entiry;
        } else {
            List<ProductReportDTO> returnBody = productAjaxService.findProductReportByBuIdAndDate(body.toString());
            return ResponseEntity.ok().body(returnBody);
        }
    }

    @PostMapping("/product/productQuickView")
    public ResponseEntity<?> findProductQV(@RequestBody String body) {
        JSONObject obj = new JSONObject(body);
        Integer tempBuId = null;
        String tempStartDate = null;
        String tempEndDate = null;

        if (!obj.isNull("buId")) {
            tempBuId = obj.getInt("buId");
        }

        if (!obj.isNull("startDate")) {
            tempStartDate = obj.getString("startDate");
        }
        if (!obj.isNull("endDate")) {
            tempEndDate = obj.getString("endDate");
        }

        if (tempBuId == null || tempStartDate == null || tempEndDate == null) {
            ResponseEntity<Void> entiry = ResponseEntity.noContent().build();
            return entiry;
        } else {
            List<ProductQuickViewDTO> returnBody = productAjaxService.findProductQVByFkBusinessIdAndDate(body.toString());
            return ResponseEntity.ok().body(returnBody);
        }
    }

}
