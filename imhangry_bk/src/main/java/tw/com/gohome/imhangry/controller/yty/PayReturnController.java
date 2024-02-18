package tw.com.gohome.imhangry.controller.yty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.repository.OrderFormRepository;
import tw.com.gohome.imhangry.service.yty.PayResultService;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;



@RestController
@RequestMapping("/")
@CrossOrigin
public class PayReturnController {

    @Autowired
    PayResultService payResultService; 

    @Autowired 
    OrderFormRepository orderFormRepository;

    // @GetMapping("return/{orderId}")
    // public String payReturn(@PathVariable(name ="orderId") Integer id) {
    //     payResultService.updateStatus(id);
    //     return null;
     
    // }
    @GetMapping("findTotal/{orderId}")
    public Integer findTotal(@PathVariable(name ="orderId") Integer id) {
        Integer total = payResultService.findTotalByOrderId(id);
        return total;
    }
    

    @PutMapping("updateText/{id}")
    public void updateText(@PathVariable Integer id, @RequestBody String text) {
        
        payResultService.updateText(text, id);
        
        
    }

    @GetMapping("updateStatus/{orderId}")
    public void updateStatus(@PathVariable(name ="orderId") Integer id) {
        payResultService.findTotalByOrderId(id);
        
    }

}
