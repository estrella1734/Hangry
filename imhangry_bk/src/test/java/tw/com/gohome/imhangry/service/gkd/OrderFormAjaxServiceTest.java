package tw.com.gohome.imhangry.service.gkd;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class OrderFormAjaxServiceTest {
    
    @Autowired
    private OrderFormAjaxService orderFormAjaxService;

    //測試方法，模擬前端傳入包含日期的JSON，轉成Service的findTodayTotalFromOrderForm方法所需要的字串，調用Repository
    //測試給日期後是否可以從orderForm拿出當日訂單總額
    @Test
    public void testFindTodayTotalFromOrderForm(){
        
        JSONObject testObj = new JSONObject()
        .put("startDate", "2024-01-01")
        .put("endDate","2024-01-31")
        .put("buId", 1);
        
        String test = testObj.toString();
        
        List<Long> todayTotalFromOrderForm = orderFormAjaxService.findTodayTotalFromOrderForm(test);
        
        System.err.println(todayTotalFromOrderForm);
    }
    
    //測試給日期後是否可以從orderForm拿出當日訂單付款狀況
    //都到的資料會長得像：[0,1,0,1,1,1,0]
    @Test
    public void testFindPSTotalFromOrderForm(){

        JSONObject testObj = new JSONObject()
        .put("startDate", "2024-01-01")
        .put("endDate","2024-01-31")
        .put("buId", 1);;

        String test = testObj.toString();

        List<Integer> todayTotalFromOrderForm = orderFormAjaxService.findTodayPSFromOrderForm(test);

        System.err.println(todayTotalFromOrderForm);
    }
    @Test
    public void testFindOrderFormPaymentTypeByBusinessId(){

        List<String> result = orderFormAjaxService.findOrderFormPaymentTypeByBusinessId(2);
        System.err.println(result);
    }

    @Test
    public void testFindPaymentTypeByFkBusinessIdAndDate(){

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date startDate = sdf.parse("2024-01-19");
            Date endDate = sdf.parse("2024-01-20");

            List<String> result = orderFormAjaxService.findOrderFormPaymentTypeByBusinessIdAndDate(1, startDate, endDate);

            System.err.println(result);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
    }

    @Test
    public void testFindOrderByBuId(){
        List<JSONObject> result = orderFormAjaxService.findOrderByBuId(1);

        System.err.println(result);
    }


}
