package tw.com.gohome.imhangry.service.leon;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.gohome.imhangry.repository.BusinessUserRepository;
import tw.com.gohome.imhangry.repository.LikesRepository;
import tw.com.gohome.imhangry.repository.OrderFormRepository;

@SpringBootTest
public class LikesServiceTests {
    @Autowired
    private LikesService likesService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    OrderFormRepository orderFormRepository;
    @Autowired
    BusinessUserRepository businessUserRepository;
    @Autowired
    LikesRepository likesRepository;

    @Test
    public void test() {
        // JSONObject obj = new JSONObject();
        // obj.put("fk_guest_id", 1);
        // obj.put("fk_business_id", 13);
        // // // System.err.println(obj);

        // System.err.println(likesRepository.existLikes(1, 13));
        // likesService.findBusinessByLikes(1);
        // likesService.Create(obj.toString());
        // System.err.println(ordersService.findOrdersByGuestId(1));
        // System.err.println(ordersService.findDetailByOrderId(1));
        // System.err.println(orderFormRepository.findUserIdFromOrderId(1));
        System.err.println(businessUserRepository.findAllType());

    }

}
