package tw.com.gohome.imhangry.service.yty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import tw.com.gohome.imhangry.repository.OrderFormRepository;

@Service
@Transactional
public class PayResultService {
    @Autowired
    OrderFormRepository orderFormRepository;

    public void updateStatus(Integer id) {
        orderFormRepository.updateStatus(id);

    }

    public void updateText(String text, Integer id){
        orderFormRepository.updateText(text, id);
    }

    public Integer findTotalByOrderId(Integer id) {
        Integer total = orderFormRepository.findTotalByOrderId(id);
        return total;
    }
}
