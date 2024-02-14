package tw.com.gohome.imhangry.repository;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.gohome.imhangry.domain.dto.OrderDetailTodayDTO;

@SpringBootTest
public class OrderDetailRepositoryTest {
    
    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Test
    public void testFindOrderFormsByBusinessId(){

        List<OrderDetailTodayDTO> orderDetailByBusinessId = orderDetailRepository.findOrderDetailByBusinessId(1);
        System.err.println(orderDetailByBusinessId);
    }
}
