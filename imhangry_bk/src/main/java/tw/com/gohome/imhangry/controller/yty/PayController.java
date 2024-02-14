package tw.com.gohome.imhangry.controller.yty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.service.yty.PayService;
import org.springframework.web.bind.annotation.PostMapping;


@RestController
public class PayController {
    
    @Autowired
    PayService payService;

    @PostMapping("/ecpayCheckout")
    public String ecpayCheckout() {
        
        String ecpayCheckout = payService.genAioCheckOutALL();
        return ecpayCheckout;
    }
    
}
