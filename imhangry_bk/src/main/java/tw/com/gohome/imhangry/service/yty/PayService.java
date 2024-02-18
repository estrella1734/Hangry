package tw.com.gohome.imhangry.service.yty;

import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Service
@CrossOrigin
public class PayService {


    public  String genAioCheckOutALL(String a){

        String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);
        AllInOne all = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
		
		obj.setMerchantTradeNo(uuId);
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount(a);
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://192.168.24.55/return");
		obj.setClientBackURL("http://192.168.24.55:4173/Orders");
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
}
