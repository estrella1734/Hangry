package tw.com.gohome.imhangry.service.bird;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.gohome.imhangry.domain.GuestAddress;
import tw.com.gohome.imhangry.repository.GuestAddressRepository;

@Service
@Transactional
public class AddressService1 {
    @Autowired
    private GuestAddressRepository guestAddressRepository;

    public List<GuestAddress> searchAddress(Integer id){
        return id == null ? null : guestAddressRepository.findByFkGuestId(id);
    }


}
