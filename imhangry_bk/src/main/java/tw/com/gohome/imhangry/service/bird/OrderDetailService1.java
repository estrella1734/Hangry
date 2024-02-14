package tw.com.gohome.imhangry.service.bird;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.gohome.imhangry.domain.OrderDetail;
import tw.com.gohome.imhangry.repository.OrderDetailRepository;

@Service
@Transactional
public class OrderDetailService1 {
    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public List<OrderDetail> insertDetail(List<OrderDetail> list){
        if(list == null || list.isEmpty()){
            return null;
        }
        List<OrderDetail> responseList = orderDetailRepository.saveAll(list);

        return responseList;
    }
}
