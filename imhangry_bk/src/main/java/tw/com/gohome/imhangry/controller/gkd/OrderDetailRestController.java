package tw.com.gohome.imhangry.controller.gkd;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.domain.dto.OrderDetailTodayDTO;
import tw.com.gohome.imhangry.service.gkd.OrderDetailAjaxService;

@RestController
@RequestMapping("/pages/rest")
@CrossOrigin(origins = "http://localhost:5173")
public class OrderDetailRestController {

    @Autowired
    private OrderDetailAjaxService orderDetailAjaxService;

    /**
     * 前端透過get傳入登入的businessId
     * 透過controller可以取得一組JSON，包含
     */
    // @GetMapping("/orderdetail/findTodayOrderDetail/{pk}")
    // public String findTodayOrderDetail(@PathVariable(name = "pk") Integer id) {
    // JSONArray responseArray = new JSONArray();

    // if (id != null) {
    // List<OrderDetailTodayDTO> orderDetail =
    // orderDetailTodayAjaxService.findOrderDetail(id);

    // for (OrderDetailTodayDTO beans : orderDetail) {
    // JSONObject responseJSON = new JSONObject();
    // responseJSON
    // .put("productName", beans.getProductName())
    // .put("amount", beans.getAmount())
    // .put("time", DatetimeConverter.toString(beans.getTime(), "yyyy-MM-dd"))
    // .put("status", beans.getStatus());
    // System.err.println("json->" + responseJSON);
    // responseArray.put(responseJSON);
    // }
    // }

    // return responseArray.toString();
    // }

    /**
     * 前端透過get傳入登入的businessId
     * 透過controller可以取得一組JSON，包含
     * 
     */
    //TODO寫註解，完善檢查機制
    @GetMapping("/orderdetail/findTodayOrderDetail/{pk}")
    public ResponseEntity<?> findTodayOrderDetail(@PathVariable(name = "pk") Integer id) {
        if (id != null) {
            List<OrderDetailTodayDTO> orderDetail = orderDetailAjaxService.findOrderDetail(id);
            return ResponseEntity.ok().body(orderDetail);
        }
        return ResponseEntity.noContent().build();
    }

}
