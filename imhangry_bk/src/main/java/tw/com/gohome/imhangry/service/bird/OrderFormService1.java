package tw.com.gohome.imhangry.service.bird;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.gohome.imhangry.domain.OrderForm;
import tw.com.gohome.imhangry.repository.OrderFormRepository;

@Service
@Transactional
public class OrderFormService1 {
    @Autowired
    private OrderFormRepository orderFormRepository;

    public OrderForm insertOrder(OrderForm orderForm){
        
        return orderForm == null ? null: orderFormRepository.save(orderForm);
    }
}
