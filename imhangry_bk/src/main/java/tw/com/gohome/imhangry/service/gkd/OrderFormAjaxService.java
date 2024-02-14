package tw.com.gohome.imhangry.service.gkd;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.gohome.imhangry.domain.dto.OrderManagerDTO;
import tw.com.gohome.imhangry.repository.OrderFormRepository;
import tw.com.gohome.imhangry.util.DatetimeConverter;

@Service
public class OrderFormAjaxService {
    @Autowired
    private OrderFormRepository orderFormRepository;

    public List<Long> findTodayTotalFromOrderForm(String json) {
        try {
            JSONObject obj = new JSONObject(json);

            // 前端json取出傳入的日期字串
            Integer buId = obj.getInt("buId");
            String startDate = obj.getString("startDate");
            String endDate = obj.getString("endDate");

            // 把從json取出的 string date轉成java.util.date
            Date stringToDateStart = DatetimeConverter.stringToDate(startDate);
            Date stringToDateEnd = DatetimeConverter.stringToDate(endDate);

            // 呼叫Repository取得返回值，一個List
            return orderFormRepository.findTotalByTimeDay(stringToDateStart, stringToDateEnd, buId);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Integer> findTodayPSFromOrderForm(String json) {
        try {
            JSONObject obj = new JSONObject(json);

            // 前端json取出傳入的日期字串
            String startDate = obj.getString("startDate");
            String endDate = obj.getString("endDate");
            Integer buId = obj.getInt("buId");

            // 把從json取出的 string date轉成java.util.date
            Date stringToDateStart = DatetimeConverter.stringToDate(startDate);
            Date stringToDateEnd = DatetimeConverter.stringToDate(endDate);

            // 呼叫Repository取得返回值，一個List
            return orderFormRepository.findPSByTimeDay(stringToDateStart, stringToDateEnd, buId);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<String> findOrderFormPaymentTypeByBusinessId(Integer buId) {
        // TODO完善檢查機制，尚未撰寫exist程式碼
        if (buId != null) {
            return orderFormRepository.findPaymentTypeByFkBusinessId(buId);
        }
        return null;
    }

    public List<String> findOrderFormPaymentTypeByBusinessIdAndDate(Integer buId, Date startDate, Date endDate) {
        if (buId != null && startDate != null && endDate != null) {
            return orderFormRepository.findPaymentTypeByFkBusinessIdAndDate(buId, startDate, endDate);
        }
        return null;
    }

    public List<JSONObject> findOrderByBuId(Integer buId) {

        //取出該店家所有訂單
        List<OrderManagerDTO> result = orderFormRepository.findOrderByBuId(buId);
        
        // 將訂單按照 id 分組
        //將OrderManagerDTO以collect方法，用ID屬性進行groupingBy分組
        Stream<OrderManagerDTO> stream = result.stream();

        Map<Integer, List<OrderManagerDTO>> groupedOrders = stream.collect(Collectors.groupingBy(OrderManagerDTO::getId));
        // System.err.println(groupedOrders);
        /* Map內容大約是{ 訂單id : OrderManagerDTO }
        392=[OrderManagerDTO(id=392, address=584 Brown Glens Suit, paymentType=ec pay, fkProductId=66, amount=2, price=135, image=training_image.jpg, name=Product address), 
        OrderManagerDTO(id=392, address=584 Brown Glens Suit, paymentType=ec pay, fkProductId=115, amount=8, price=295, image=hour_image.jpg, name=Product change)...]
        */

        // 將分組後的訂單轉換成JSONObject
        ArrayList<JSONObject> formattedOrders = new ArrayList<>();

        //: 這行程式碼使用 foreach 迴圈遍歷 groupedOrders Map 中的每一個 entry，entry 是每個 entry 的代表，它是一個 key-value 對。
        for (Map.Entry<Integer, List<OrderManagerDTO>> entry : groupedOrders.entrySet()) {

            //建立一個新的 JSONObject 物件，用來表示一個訂單的資訊。
            JSONObject orderJson = new JSONObject();
            //orderJson.put("id", entry.getKey());: 將目前迴圈所處的 entry 的 key（即訂單的 id）放入 orderJson 中。
            orderJson.put("id", entry.getKey());
            //  取得這個 entry 的 value（即訂單資料列表），然後從這個列表中取得第一筆訂單資料，並取得其 address，再將其放入 orderJson 中。
            orderJson.put("address", entry.getValue().get(0).getAddress());
            //  同上，取得第一筆訂單資料的 paymentType，並放入 orderJson 中。
            orderJson.put("paymentType", entry.getValue().get(0).getPaymentType());

            //List<JSONObject> productsJson = entry.getValue().stream()...: 這行程式碼建立一個名為 productsJson 的 List，用來存放每個訂單的產品資訊。它使用 Java 8 中的 Stream API 將 entry 的 value 轉換成 Stream，然後對每個訂單進行映射，將每個訂單轉換成對應的 JSONObject（表示產品資訊），並收集成一個 List。
            List<JSONObject> productsJson = entry.getValue().stream()
                    .map(order -> {
                        JSONObject productJson = new JSONObject();
                        productJson.put("fkProductId", order.getFkProductId());
                        productJson.put("amount", order.getAmount());
                        productJson.put("price", order.getPrice());
                        productJson.put("image", order.getImage());
                        productJson.put("name", order.getName());
                        return productJson;
                    })
                    .collect(Collectors.toList());

            //orderJson.put("products", new JSONArray(productsJson));: 最後，將剛剛收集到的 productsJson List 轉換成 JSONArray，表示訂單的產品資訊列表，並放入 orderJson 中。
            orderJson.put("products", new JSONArray(productsJson));
            //formattedOrders.add(orderJson);: 將目前組裝好的訂單資訊（即 orderJson）加入到 formattedOrders 列表中。
            formattedOrders.add(orderJson);
        }

        return formattedOrders;
    }

}
