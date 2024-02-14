package tw.com.gohome.imhangry.controller.yty;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.annotation.Resource;
import tw.com.gohome.imhangry.domain.BusinessUser;
import tw.com.gohome.imhangry.service.yty.UserService;
import tw.com.gohome.imhangry.service.yty.util.Result;


@RestController
@RequestMapping("/user")
@CrossOrigin
public class UserController {
    @Resource
    private UserService userService;

    @PostMapping("/login")
    public Result<BusinessUser> postMethodName(@RequestParam String name, @RequestParam String password) {
        
        BusinessUser bUser = userService.loginService(name, password);
        if (bUser != null) {
            return Result.success(bUser,"登入成功");
        }else{
            return Result.error("123", "帳號或密碼錯誤!");
        }
    }

    @PostMapping("/BusinessRegister")
public Result<BusinessUser> registController(@RequestBody BusinessUser newUser){
    BusinessUser user = userService.registService(newUser);
    if(user!=null){
        return Result.success(user,"注册成功！");
    }else{
        return Result.error("456","用户名已存在！");
    }
}
    

}
