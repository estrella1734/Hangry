package tw.com.gohome.imhangry.service.gkd;

import java.util.Date;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.gohome.imhangry.domain.dto.ProductQuickViewDTO;
import tw.com.gohome.imhangry.domain.dto.ProductReportDTO;
import tw.com.gohome.imhangry.repository.ProductRepository;
import tw.com.gohome.imhangry.util.DatetimeConverter;

@Service
public class ProductAjaxService {

    @Autowired
    private ProductRepository productRepository;

    public List<ProductReportDTO> findProductReportByBuIdAndDate(String json) {

        try {
            JSONObject obj = new JSONObject(json);

            // 前端json取出傳入的日期字串
            Integer buId = obj.getInt("buId");
            String startDate = obj.getString("startDate");
            String endDate = obj.getString("endDate");

            // 把從json取出的 string date轉成java.util.date
            Date stringToDateStart = DatetimeConverter.stringToDate(startDate);
            Date stringToDateEnd = DatetimeConverter.stringToDate(endDate);

            // 呼叫Repository取得返回值，一個List
            return productRepository.findReportByFkBusinessIdAndDate(buId, stringToDateStart, stringToDateEnd);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<ProductQuickViewDTO> findProductQVByFkBusinessIdAndDate(String json) {

        try {
            JSONObject obj = new JSONObject(json);

            // 前端json取出傳入的日期字串
            Integer buId = obj.getInt("buId");
            String startDate = obj.getString("startDate");
            String endDate = obj.getString("endDate");

            // 把從json取出的 string date轉成java.util.date
            Date stringToDateStart = DatetimeConverter.stringToDate(startDate);
            Date stringToDateEnd = DatetimeConverter.stringToDate(endDate);

            // 呼叫Repository取得返回值，一個List
            return productRepository.findProductQVByFkBusinessIdAndDate(buId, stringToDateStart, stringToDateEnd);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
