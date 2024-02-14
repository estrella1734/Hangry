package tw.com.gohome.imhangry.service.leon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.gohome.imhangry.domain.OrderDetail;
import tw.com.gohome.imhangry.domain.OrderForm;
import tw.com.gohome.imhangry.repository.OrderDetailRepository;
import tw.com.gohome.imhangry.repository.OrderFormRepository;

@Service
@Transactional
public class OrdersService {
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    @Autowired
    private OrderFormRepository orderFormRepository;
    public List<OrderForm> findOrdersByGuestId(Integer id){
       return orderFormRepository.findByfkGuestId(id);
    }
    public List<OrderDetail> findDetailByOrderId(Integer id){
        return orderDetailRepository.findDetailByOrderId(id);
     }




}
