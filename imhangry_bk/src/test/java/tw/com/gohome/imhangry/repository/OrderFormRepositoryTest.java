package tw.com.gohome.imhangry.repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.gohome.imhangry.domain.OrderForm;
import tw.com.gohome.imhangry.domain.dto.OrderFormManagementDTO;
import tw.com.gohome.imhangry.domain.dto.OrderManagerDTO;

@SpringBootTest
public class OrderFormRepositoryTest {

    @Autowired
    private OrderFormRepository orderFormRepository;

    // 1.
    @Test
    public void testFindTotalByTimeDay() {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate;
        Date endDate;

        try {
            startDate = formatter.parse("2024-01-01");
            endDate = formatter.parse("2024-01-31");
            Integer buId= 1;
            List<Long> result = orderFormRepository.findTotalByTimeDay(startDate, endDate, buId);
            System.err.println(result);
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    // 2.
    @Test
    public void testFindPSByTimeDay() {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate;
        Date endDate;
        Integer buId = 1;

        try {
            startDate = formatter.parse("2024-01-01");
            endDate = formatter.parse("2024-01-31");
            List<Integer> result = orderFormRepository.findPSByTimeDay(startDate, endDate,buId);
            System.err.println(result);
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    // 3.
    @Test
    public void testFindPaymentTypeByBusinessId() {
        List<String> payString = orderFormRepository.findPaymentTypeByFkBusinessId(2);

        System.err.println("payString->" + payString);
    }

    // 4.
    @Test
    public void testFindPaymentTypeByFkBusinessIdAndDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate;
        Date endDate;

        try {
            startDate = format.parse("2024-01-19");
            endDate = format.parse("2024-01-20");

            List<String> result = orderFormRepository.findPaymentTypeByFkBusinessIdAndDate(1, startDate, endDate);
            System.err.println(result);
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    // 5.
    @Test
    public void testFindOrderByBuId(){

        List<OrderManagerDTO> orders = orderFormRepository.findOrderByBuId(1);

        System.err.println(orders);

    } 

    // 以下未使用方法的測試程式
    // @Test
    public void testFindByFkBusinessId() {
        List<OrderForm> result = orderFormRepository.findByFkGuestId(1);
        System.err.println(result);
    }

    // @Test
    public void testFindTotalByTime() {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date;

        try {
            date = formatter.parse("2024-02-13");
            List<Long> result = orderFormRepository.findTotalByTime(date);
            System.err.println(result);
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    // @Test
    public void testFindOrderFormsByFKBusiness() {
        List<OrderFormManagementDTO> orderByBuId = orderFormRepository.findOrderFormsByBusinessId(1);
        System.err.println(orderByBuId);

    }

}
