package tw.com.gohome.imhangry.service.gkd;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.gohome.imhangry.domain.dto.OrderDetailTodayDTO;

@SpringBootTest
public class OrderDetailAjaxServiceTest {
    
    @Autowired
    private OrderDetailAjaxService orderDetailAjaxService;

    @Test
    public void testFindOrderDetail(){
        List<OrderDetailTodayDTO> orderDetail = orderDetailAjaxService.findOrderDetail(1);
        System.err.println(orderDetail);
    }

}
