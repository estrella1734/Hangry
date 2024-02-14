package tw.com.gohome.imhangry.service.ys;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.charset.UnsupportedCharsetException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import tw.com.gohome.imhangry.domain.Coupon;
import tw.com.gohome.imhangry.repository.CouponRepository;

@Service
@Transactional
public class CouponServiceImpl implements CouponService {
    @Resource
    private CouponRepository couponRepository;

    @Override
    public Coupon saveCoupon(Coupon cp) {

        return couponRepository.save(cp);

    }

    @Override
    public List<Coupon> getCoupons() {
        return couponRepository.getCoupons();
    }

    @Override
    public void updateCouponAmount(Integer couponId) {
        try {
            // 根據couponId從數據庫中獲取Coupon對象

            Coupon coupon = couponRepository.findById(couponId).orElse(null);

            // 如果Coupon存在
            if (coupon != null) {
                // 獲取當前amount值
                Integer currentAmount = coupon.getAmount();

                // 檢查amount是否大於0
                if (currentAmount > 0) {
                    // 將amount減1
                    coupon.setAmount(currentAmount - 1);

                    // 更新Coupon對象到數據庫
                    couponRepository.save(coupon);
                } else {
                    // 如果amount小於等於0，拋出錯誤訊息
                    throw new RuntimeException("Coupon amount is not sufficient");
                }
            } else {
                // 如果找不到對應的Coupon，拋出錯誤訊息
                throw new RuntimeException("Coupon not found");
            }

        } catch (Exception e) {
            // Handle the exception or log it
            e.printStackTrace();
            throw new RuntimeException("Error updating coupon amount: " + e.getMessage());
        }

    }

    @Override
    public List<Integer> getAllCouponIds() {
        List<Integer> couponIds = couponRepository.getAllCouponIds();
        return couponIds;
    }

    @Override
    public void rollbackCouponAmountUpdate(Integer couponId) {
        // 獲取優惠券的原始數量
        Coupon coupon = couponRepository.findById(couponId).orElse(null);

        if (coupon != null) {
            // 回滾優惠券的數量
            coupon.setAmount(coupon.getAmount() + 1); // 假設數量是可以相加的
            couponRepository.save(coupon);
        }
    }

    @Override
    public void saveCouponsFromCsv(InputStream inputStream) throws IOException {
        try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
                CSVParser csvParser = new CSVParser(fileReader,
                        CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim())) {

            List<Coupon> coupons = new ArrayList<>();

            Iterable<CSVRecord> csvRecords = csvParser.getRecords();

            for (CSVRecord csvRecord : csvRecords) {
                Coupon coupon = new Coupon();

                // 設定 title
                String title = csvRecord.get("title");
                coupon.setTitle(title != null && !title.isEmpty() ? title : null);
                // 設定 discount
                coupon.setDiscount(Integer.parseInt(csvRecord.get("discount")));

                // 設定 threshold
                coupon.setThreshold(Integer.parseInt(csvRecord.get("threshold")));

                // 設定 amount
                coupon.setAmount(Integer.parseInt(csvRecord.get("amount")));

                // 設定 description
                String description = csvRecord.get("description");
                coupon.setDescription(description != null && !description.isEmpty() ? description : null);

                // 設定 createDate
                coupon.setCreateDate(new Date());

                // 設定 startDate
                String startDateString = csvRecord.get("startDate");
                LocalDateTime startDate = startDateString != null ? parseDateTime(startDateString) : null;
                coupon.setStartDate(
                        startDate != null ? Date.from(startDate.atZone(ZoneId.systemDefault()).toInstant()) : null);

                // 設定 endDate
                String endDateString = csvRecord.get("endDate");
                LocalDateTime endDate = endDateString != null ? parseDateTime(endDateString) : null;
                coupon.setEndDate(
                        endDate != null ? Date.from(endDate.atZone(ZoneId.systemDefault()).toInstant()) : null);

                coupons.add(coupon);
            }

            couponRepository.saveAll(coupons);
        }
    }

    @Override
    public LocalDateTime parseDateTime(String dateTimeString) {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return LocalDateTime.parse(dateTimeString, formatter);
        } catch (DateTimeParseException e) {
            e.printStackTrace();
            return null;
        }
    }

}