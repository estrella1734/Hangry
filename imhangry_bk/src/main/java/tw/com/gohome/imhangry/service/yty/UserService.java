package tw.com.gohome.imhangry.service.yty;

import java.util.Optional;

import tw.com.gohome.imhangry.domain.BusinessUser;

public interface UserService {

    BusinessUser loginService(String name, String password);
    BusinessUser registService(BusinessUser user);
    
} 
