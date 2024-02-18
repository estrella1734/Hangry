package tw.com.gohome.imhangry.service.yty;

import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import tw.com.gohome.imhangry.domain.BusinessUser;
import tw.com.gohome.imhangry.repository.BusinessUserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Resource
    private BusinessUserRepository bUserRepo;

    @Override
    public BusinessUser loginService(String name, String password) {

        BusinessUser bUser = bUserRepo.findByEngNameAndPassword(name, password);

        if (bUser != null) {
            // bUser.setPassword("");
        }

        return bUser;

    }

    @Override
    public BusinessUser registService(BusinessUser user) {

        if (bUserRepo.findByEngName(user.getName()) != null) {
            return null;
        } else {
            BusinessUser newUser = bUserRepo.save(user);
            if (newUser != null) {
                // newUser.setPassword("");
            }
            return newUser;
        }
    }

}
