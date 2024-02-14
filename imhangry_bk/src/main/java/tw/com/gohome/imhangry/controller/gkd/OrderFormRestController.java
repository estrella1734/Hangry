package tw.com.gohome.imhangry.controller.gkd;

import java.util.Date;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.service.gkd.OrderFormAjaxService;
import tw.com.gohome.imhangry.util.DatetimeConverter;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
@RequestMapping("/pages/rest")
@CrossOrigin
public class OrderFormRestController {

    @Autowired
    private OrderFormAjaxService orderFormAjaxService;

    // 找出當日營業額的service，呼叫findTodayTotalFromOrderForm方法回傳一組內容類似[xxxx,xxxx,xxxx,xxxx]的陣列
    // requestBody會傳入一組有start、endDate的JSON，確認好內部有值就呼叫service
    @PostMapping("/orderform/findTodayTotalFromOrderForm")
    public ResponseEntity<?> findTotalByDates(@RequestBody String body) {

        JSONObject obj = new JSONObject(body);

        String tempStartDate = obj.isNull("startDate") ? null : obj.getString("startDate");

        String tempEndDate = obj.isNull("endDate") ? null : obj.getString("endDate");

        Integer buId = obj.isNull("buId") ? null : obj.getInt("buId");

        // 驗證body內的json欄位startDate有沒有資料
        // 如果日期格式不對或是沒有輸入，回傳ResponseEntity<void>
        if (tempStartDate == null || tempEndDate == null || buId == null) {
            ResponseEntity<Void> entity = ResponseEntity.noContent().build();
            return entity;
        } else {
            // 這裡傳入json->String
            List<Long> beans = orderFormAjaxService.findTodayTotalFromOrderForm(obj.toString());
            return ResponseEntity.ok().body(beans);
            // -------
        }
    }

    // TODO放入buid
    // 找出付款狀況的service，呼叫findTodayPSFromOrderForm方法回傳一組內容類似[0,1,1,0]的陣列
    // requestBody會傳入一組有start、endDate的JSON，確認好內部有值就呼叫service
    @PostMapping("/orderform/findTodayPSFromOrderForm")
    public ResponseEntity<?> findPSByDates(@RequestBody String body) {

        JSONObject obj = new JSONObject(body);

        String tempStartDate = obj.isNull("startDate") ? null : obj.getString("startDate");

        String tempEndDate = obj.isNull("endDate") ? null : obj.getString("endDate");

        Integer buId = obj.isNull("buId") ? null : obj.getInt("buId");

        // 驗證body內的json欄位startDate有沒有資料
        // 如果日期格式不對或是沒有輸入，回傳ResponseEntity<void>
        if (tempStartDate == null || tempEndDate == null || buId == null) {
            ResponseEntity<Void> entiry = ResponseEntity.noContent().build();
            return entiry;
        } else {
            // 這裡傳入json->String
            List<Integer> beans = orderFormAjaxService.findTodayPSFromOrderForm(obj.toString());
            return ResponseEntity.ok().body(beans);
            // -------
        }
    }

    @GetMapping("/orderform/findPieChart/{pk}")
    public ResponseEntity<?> findPieChart(@PathVariable(name = "pk") Integer buId) {
        if (buId != null) {
            List<String> result = orderFormAjaxService.findOrderFormPaymentTypeByBusinessId(buId);

            return ResponseEntity.ok().body(result);
        }

        return ResponseEntity.noContent().build();
    }

    @PostMapping("/orderform/findPaymentTypeByDate")
    public ResponseEntity<?> findPTByDate(@RequestBody String body) {
        JSONObject information = new JSONObject(body);
        Integer buId = information.isNull("buId") ? null : information.getInt("buId");
        String startDateString = information.isNull("startDate") ? null : information.getString("startDate");
        String endDateString = information.isNull("endDate") ? null : information.getString("endDate");

        if (buId == null || startDateString == null || endDateString == null) {
            ResponseEntity<Void> entity = ResponseEntity.noContent().build();
            return entity;
        } else {
            Date startDate = DatetimeConverter.stringToDate(startDateString);
            Date endDate = DatetimeConverter.stringToDate(endDateString);
            List<String> result = orderFormAjaxService.findOrderFormPaymentTypeByBusinessIdAndDate(buId, startDate,
                    endDate);

            return ResponseEntity.ok().body(result);
        }
    }

    @GetMapping("/orderform/orderManager/{pk}")
    public ResponseEntity<?> findOrderByBuId(@PathVariable(name = "pk") Integer buId) {

        if (buId != null) {
            List<JSONObject> result = orderFormAjaxService.findOrderByBuId(buId);

            return ResponseEntity.ok().body(result.toString());
        }

        return ResponseEntity.noContent().build();

    }

}
