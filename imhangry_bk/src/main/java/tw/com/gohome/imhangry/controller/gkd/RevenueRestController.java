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

import tw.com.gohome.imhangry.domain.Revenue;
import tw.com.gohome.imhangry.service.gkd.RevenueAjaxService;

@RestController
@RequestMapping("/pages/rest")
@CrossOrigin(origins = "http://localhost:5173")
public class RevenueRestController {

    @Autowired
    private RevenueAjaxService revenueAjaxService;

    @PostMapping("/revenue/findByDates")
    public ResponseEntity<?> findByDates(@RequestBody String body) {
        JSONObject obj = new JSONObject(body);

        String tempStartDate = obj.isNull("startDate") ? null : obj.getString("startDate");
        System.out.println("tempStartDate->"+tempStartDate);

        String tempEndDate = obj.isNull("endDate") ? null : obj.getString("endDate");
        System.out.println("tempEndDate->"+tempEndDate);
        
        //TODO後續加上驗證日期格式的判斷式
        // 驗證body內的json欄位startDate有沒有資料
        //如果日期格式不對或是沒有輸入，回傳ResponseEntity<void>
        if (tempStartDate == null || tempEndDate == null ) {
            ResponseEntity<Void> entiry = ResponseEntity.noContent().build();
            return entiry;
        } else {
            List<Revenue> beans = revenueAjaxService.findRevenueBetweenDates(obj.toString());
            return ResponseEntity.ok().body(beans);
            //-------
        }
    }
}