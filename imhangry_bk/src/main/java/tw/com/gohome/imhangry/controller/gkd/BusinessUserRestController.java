package tw.com.gohome.imhangry.controller.gkd;

import java.util.Optional;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.domain.BusinessUser;
import tw.com.gohome.imhangry.service.gkd.BusinessUserAjaxService;

@RestController
@RequestMapping("/pages/rest")
@CrossOrigin
public class BusinessUserRestController {

    @Autowired
    private BusinessUserAjaxService businessUserAjaxService;

    // 查詢，將資料填入欄位中
    @GetMapping("/businessUser/findInformation/{pk}")
    public ResponseEntity<?> findUserInfo(@PathVariable(name = "pk") Integer BuId) {
        if (BuId != null && BuId <= 12) {
            Optional<BusinessUser> result = businessUserAjaxService.findBUById(BuId);
            return ResponseEntity.ok().body(result);
        }
        return ResponseEntity.noContent().build();
    }

    //修改，將新的資料儲存
    @PutMapping("/businessUser/modify")
    public ResponseEntity<?> modifyUserInfo (@RequestBody String body){
        JSONObject obj = new JSONObject(body);
        Integer BuId = obj.getInt("BuId");  
        BusinessUser modifyBUById = businessUserAjaxService.modifyBUById(BuId, obj);
        return ResponseEntity.ok().body(modifyBUById.toString());
    }

    @GetMapping("/businessUser/findAllBusiness")
    public ResponseEntity<?> findAllBusiness(){
        
        String beans = businessUserAjaxService.findAll();
        return ResponseEntity.ok().body(beans.toString());

    }

}
