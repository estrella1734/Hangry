package tw.com.gohome.imhangry.service.gkd;

import java.util.List;
import java.util.Optional;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.com.gohome.imhangry.domain.BusinessUser;
import tw.com.gohome.imhangry.domain.dto.HomeBuInfoDTO;
import tw.com.gohome.imhangry.repository.BusinessUserRepository;

@Service
public class BusinessUserAjaxService {

    @Autowired
    private BusinessUserRepository businessUserRepository;

    public Optional<BusinessUser> findBUById(Integer BuId) {
        if (BuId != null && BuId <= 12) {
            Optional<BusinessUser> result = businessUserRepository.findById(BuId);
            return result;
        }
        return null;
    }

    public BusinessUser modifyBUById(Integer BuId, JSONObject newData) {
        Optional<BusinessUser> result = businessUserRepository.findById(BuId);

        // 如果不存在
        if (!result.isPresent()) {
            System.err.println("未找到 ID BusinessUser");
        } else {
            // user目前放入從資料庫拿出的舊有資料
            BusinessUser user = result.get();

            user.setPhone(newData.getString("phone"));
            user.setOperationTime(newData.getString("operationTime"));
            user.setBusinessType(newData.getString("businessType"));
            user.setAddress(newData.getString("address"));
            user.setDescribe(newData.getString("describe"));

            BusinessUser save = businessUserRepository.save(user);
            System.out.println("有改到");
            return save;
        }
        return null;
    }

    public String findAll() {

        // 把抓出的每個BUBean轉成json
        List<HomeBuInfoDTO> all = businessUserRepository.findAllDTO();

        ObjectMapper objectMapper = new ObjectMapper();

        try {
            String jsonString = objectMapper.writeValueAsString(all);
            // System.out.println(jsonString);

            return jsonString;
            
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return null;
    }

}
