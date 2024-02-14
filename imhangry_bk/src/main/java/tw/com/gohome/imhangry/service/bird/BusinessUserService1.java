package tw.com.gohome.imhangry.service.bird;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.gohome.imhangry.domain.dto.BusinessUserOrderPageDTO;
import tw.com.gohome.imhangry.repository.BusinessUserRepository;

@Service
@Transactional
public class BusinessUserService1 {
    @Autowired 
    private BusinessUserRepository businessUserRepository;




    public BusinessUserOrderPageDTO getBusinessUserInfo(Integer id){
        if(id != null){
            return businessUserRepository.findUser(id);
        
        } 
        
        return null; 
        }

    
}
