package tw.com.gohome.imhangry.service.gkd;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.gohome.imhangry.domain.Revenue;
import tw.com.gohome.imhangry.repository.RevenueRepository;

@Service
public class RevenueAjaxService {
    @Autowired
    private RevenueRepository revenueRepository;

    //這個Service是傳入JSON，呼叫Repository的Criteria方法。
    public List<Revenue> findRevenueBetweenDates(String json) {
        try {
            JSONObject obj = new JSONObject(json);
            return revenueRepository.findRevenueBetweenDates(obj);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
