package tw.com.gohome.imhangry.service.gkd;

import java.util.Optional;

import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.gohome.imhangry.domain.BusinessUser;

@SpringBootTest
public class BusinessUserAjaxServiceTest {

    @Autowired
    private BusinessUserAjaxService businessUserAjaxService;

    @Test
    public void testFindByBuId() {
        Optional<BusinessUser> result = businessUserAjaxService.findBUById(1);
        System.err.println(result);
    }

    @Test
    public void testModifyBUById() {
        JSONObject test = new JSONObject().put("phone", "0988-921-025").put("operationTime", "08:00-17:00")
                .put("businessType", "飲料店").put("address", "新北市").put("describe", "敘述");

        BusinessUser result = businessUserAjaxService.modifyBUById(1, test);

        System.err.println(result);
    }

    @Test
    public void testFindAll() {
        String all = businessUserAjaxService.findAll();
        System.err.println(all);
    }

}
