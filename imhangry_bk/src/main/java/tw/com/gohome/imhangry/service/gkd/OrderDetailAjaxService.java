package tw.com.gohome.imhangry.service.gkd;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.gohome.imhangry.domain.dto.OrderDetailTodayDTO;
import tw.com.gohome.imhangry.repository.OrderDetailRepository;

@Service
public class OrderDetailAjaxService {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public List<OrderDetailTodayDTO> findOrderDetail(Integer buId) {

            return orderDetailRepository.findOrderDetailByBusinessId(buId);
        
    }
}
