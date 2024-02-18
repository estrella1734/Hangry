package tw.com.gohome.imhangry.controller.yty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.service.yty.PayService;

@RestController
@CrossOrigin
public class PayController {

    @Autowired
    PayService payService;

    @GetMapping("/ecpayCheckout/{total}")
    public String ecpayCheckout(@PathVariable String total) {

        try {
            String ecpayCheckout = payService.genAioCheckOutALL(total);
            return ecpayCheckout;
        } catch (Exception e) {
            System.err.println("errorrrrrrrrrrrrrrr");
            e.printStackTrace();
            return "errorrrrrrrrrrrrrrr";
        }
    }

}
