package tw.com.gohome.imhangry.service.yty;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class PayTests {

    @Autowired
    PayResultService aaa;

    // @Test
    public void updateStatus(){
        aaa.updateStatus(7);
    }

    // @Test
    public void updateText(){
        aaa.updateText("aaaaa", 1);
    }

    @Test
    public void findTotalByOrderId(){
        Integer total = aaa.findTotalByOrderId(253);
        System.err.println("total="+total);
    }
    
}
