package tw.com.gohome.imhangry.service.bird;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.gohome.imhangry.domain.Customize;
import tw.com.gohome.imhangry.domain.CustomizeOption;
import tw.com.gohome.imhangry.repository.CustomizeOptionRepository;
import tw.com.gohome.imhangry.repository.CustomizeRepository;

@Transactional
@Service
public class CustomizeService1 {
    @Autowired
    private CustomizeRepository customizeRepository;
    @Autowired
    private CustomizeOptionRepository customizeOptionRepository;


    public List<Map<String,Object>> searchCustomizes(Integer categoryId){
        if(categoryId != null){
            List<Customize> Customizes = customizeRepository.findByFkCategoryId(categoryId);
            if(Customizes!=null && !Customizes.isEmpty()){
                List<Map<String,Object>> result = new ArrayList<>();
                Customizes.forEach(item->{
                    List<CustomizeOption> temOptions = customizeOptionRepository.findByFkCustomizeId(item.getId());
                    Map<String,Object> temMap = new HashMap<>();
                    temMap.put("id", item.getId());
                    temMap.put("customizeName", item.getCustCateName());
                    temMap.put("customizeOption", temOptions);
                    result.add(temMap);
                });
                return result;
            }
        }
        return null;
    }
}
