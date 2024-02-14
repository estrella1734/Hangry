package tw.com.gohome.imhangry.controller.leon;

import java.util.List;
import java.util.Optional;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.domain.BusinessUser;
import tw.com.gohome.imhangry.domain.OrderDetail;
import tw.com.gohome.imhangry.domain.OrderForm;
import tw.com.gohome.imhangry.repository.BusinessUserRepository;
import tw.com.gohome.imhangry.repository.OrderFormRepository;
import tw.com.gohome.imhangry.service.leon.OrdersService;

import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/")
@CrossOrigin
public class OrdersController {
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private BusinessUserRepository businessUserRepository;
    @Autowired
    private OrderFormRepository orderFormRepository;

    @GetMapping("orders/{id}")
    public String getOrderForms(@PathVariable(name = "id") Integer id) {
        System.err.println(ordersService.findOrdersByGuestId(id));
        JSONObject responseJson = new JSONObject();
        JSONArray array = new JSONArray();
        List<OrderForm> ordersByGuestId = ordersService.findOrdersByGuestId(id);
        if (ordersByGuestId != null && !ordersByGuestId.isEmpty()) {
            for (OrderForm orderForm : ordersByGuestId) {
                Optional<BusinessUser> findByBusId = businessUserRepository.findById(orderForm.getFkBusinessId());

                BusinessUser businessUser = findByBusId.get();

                JSONObject object = new JSONObject()
                        .put("fkBusinessId", orderForm.getFkBusinessId())
                        .put("total", orderForm.getTotal())
                        .put("businessUserName", businessUser.getName())
                        .put("orderId", orderForm.getId())
                        .put("paymentStatus", orderForm.getPaymentStatus());
                array = array.put(object);

            }
        }
        // System.err.println(array);
        // System.err.println(detailArray);
        responseJson.put("list", array);
        return responseJson.toString();
    }

    @GetMapping("OrderDetail/{orderId}")
    public String getOrderDetail(@PathVariable(name = "orderId") Integer orderId) {
        JSONArray detailArray = new JSONArray();
        JSONObject responseJson = new JSONObject();
        List<OrderDetail> detailByOrderId = ordersService.findDetailByOrderId(orderId);
        System.err.println();

        Optional<BusinessUser> business = businessUserRepository
                .findById(orderFormRepository.findUserIdFromOrderId(orderId).getFkBusinessId());
        BusinessUser businessUser = business.get();

        if (detailByOrderId != null && !detailByOrderId.isEmpty()) {
            for (OrderDetail orderDetail : detailByOrderId) {
                String describe[] = orderDetail.getDescribe().split(":");
                String responseDescribe = "";
                for (int x = 1; x < describe.length; x += 2) {
                    responseDescribe += " " + describe[x] + " /";
                }
                responseDescribe = responseDescribe.substring(0, responseDescribe.length() - 1);

                JSONObject detail = new JSONObject()
                        .put("id", orderDetail.getId())
                        .put("price", orderDetail.getPrice())
                        .put("amount", orderDetail.getAmount()).put("name", orderDetail.getName())
                        .put("productTotal", orderDetail.getProductTotal())
                        .put("businessUserName", businessUser.getName())
                        .put("describe", responseDescribe);
                detailArray = detailArray.put(detail);

                System.err.println(responseDescribe);

                responseJson.put("detail", detailArray);

            }
        }

        System.err.println(responseJson.toString());
        return responseJson.toString();
    }

}
