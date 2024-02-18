package tw.com.gohome.imhangry.controller.sean;

import java.util.Base64;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tw.com.gohome.imhangry.domain.GuestUser;
import tw.com.gohome.imhangry.service.sean.GuestUserService;
import tw.com.gohome.imhangry.service.sean.dto.GuestUserInfoDTO;

@RestController
@RequestMapping("/api/guestuser")
public class LoginController {
    @Autowired
    private GuestUserService guestUserService;

    // 修改會員資料
    @CrossOrigin
    @PutMapping("/updateInfo/{id}")
    public String updateMemberInfo(@PathVariable Integer id, @RequestBody String json) {
        JSONObject responseJson = new JSONObject(json);
        if (id != null && guestUserService.guestUserIdExiste(id)) {
            String name = responseJson.isNull("name") ? null : responseJson.getString("name");
            if (!guestUserService.isValidName(name)) {
                responseJson.put("message", "名字不符合格式");
                responseJson.put("success", false);
            } else {
                GuestUser guestUser = guestUserService.guestUserInfoUpdate(id, json);
                if (guestUser == null) {
                    responseJson.put("message", "修改資料失敗");
                    responseJson.put("success", false);
                } else {
                    responseJson.put("message", "修改資料成功");
                    responseJson.put("success", true);
                }
            }

        }
        return responseJson.toString();
    }

    // 會員登入
    @CrossOrigin
    @PostMapping("/login")
    public String guestUserLogin(@RequestBody String json, HttpSession session,
            HttpServletResponse response) {

  

        JSONObject responseJson = new JSONObject();
        // 接收使用者輸入資料
        JSONObject obj = new JSONObject(json);
        String email = obj.isNull("email") ? null : obj.getString("email");
        String password = obj.isNull("password") ? null : obj.getString("password");
        // 驗證使用者輸入的資料
        if (email == null || email.length() == 0) {
            responseJson.put("message", "請輸入帳號");
            responseJson.put("success", false);
            return responseJson.toString();
        }
        if (password == null || password.length() == 0) {
            responseJson.put("message", "請輸入密碼");
            responseJson.put("success", false);
            return responseJson.toString();
        }
        // 呼叫企業邏輯程式
        System.err.println("1111111111111111111111111111111" + email + " " + password);

        GuestUser bean = guestUserService.login(email, password);
        System.err.println("22222222222222222222222222222222222" + email + " " + password);

        // 根據執行結果呼叫View
        if (bean == null) {
            responseJson.put("message", "登入失敗");
            responseJson.put("success", false);
        } else {
            // 成功登入將memberId和memberAccount轉成son存入cookie
            JSONObject guestUserData = new JSONObject();
            guestUserData.put("id", bean.getId());
            guestUserData.put("email", bean.getEmail());
            guestUserData.put("name", bean.getName());
            guestUserData.put("phone", bean.getPhone());

            System.err.println("111111111" + email + " " + password);
            // 序列化成JSON格式
            String jsonData = guestUserData.toString();
            // 使用Base64編碼
            jsonData = Base64.getEncoder().encodeToString(jsonData.getBytes());
            // jsonData = Base64.getEncoder().encodeToString(jsonData.getBytes());
            // 將jsonData存入名為userData的Cookie
            Cookie guestUserCookie = new Cookie("userData", jsonData);
            // 設定Cookie有效時間，單位為秒
            guestUserCookie.setMaxAge(24 * 60 * 60);
            // 設定Cookie的作用範圍
            guestUserCookie.setPath("/");

            responseJson.put("message", "登入成功");
            responseJson.put("success", true);
            // responseJson.put("success", jsonData);

            // 將Cookie加入到Response中
            response.addCookie(guestUserCookie);
        }
        System.err.println(responseJson);
        return responseJson.toString();
    }

    // 會員註冊
    @CrossOrigin
    @PostMapping("/register")
    public String guestUserRegister(@RequestBody String json) {
        JSONObject responseJson = new JSONObject(json);
        //
        // 接收使用者輸入的資料
        JSONObject obj = new JSONObject(json);
        String email = obj.isNull("email") ? null : obj.getString("email");
        String password = obj.isNull("password") ? null : obj.getString("password");
        String phone = obj.isNull("phone") ? null : obj.getString("phone");
        String name = obj.isNull("name") ? null : obj.getString("name");

        // 檢查帳號是否為Email格式
        if (email != null && !guestUserService.isValidEmailFormat(email)) {
            responseJson.put("message", "請輸入有效的Email");
            responseJson.put("success", false);
            // 檢查帳號是否已存在
        } else if (guestUserService.emailExists(email)) {
            responseJson.put("message", "此Email已被註冊");
            responseJson.put("success", false);
            // 檢查密碼強度:包含英文數字,且長度大於8
        } else if (!guestUserService.isPwdStrong(password)) {
            responseJson.put("message", "密碼必須同時包含英文數字");
            responseJson.put("success", false);
        } else if (!guestUserService.pwdLength(password)) {
            responseJson.put("message", "密碼長度至少8個字元");
            responseJson.put("success", false);
            // 姓名是否符合格式:至少二位元且只能有中文及英文不得有特殊字元(包含空格)
        } else if (!guestUserService.isValidName(name)) {
            responseJson.put("message", "名字不符合格式");
            responseJson.put("success", false);
            // 檢查手機是否符合格式:台灣地區 09 開頭，或以 +886 開頭，後面接8位數字
        } else if (!guestUserService.isValidPhoneNumber(phone)) {
            responseJson.put("message", "請輸入有效的手機號碼");
            responseJson.put("success", false);
            // 檢查手機是否已存在
        } else if (guestUserService.phoneExists(phone)) {
            responseJson.put("message", "此號碼已被使用");
            responseJson.put("success", false);
        } else {
            GuestUser guestUser = guestUserService.register(json);
            if (guestUser == null) {
                responseJson.put("message", "新增失敗");
                responseJson.put("success", false);
            } else {
                responseJson.put("message", "新增成功");
                responseJson.put("success", true);
            }
        }
        return responseJson.toString();
    }

    // 個人頁面顯示
    @CrossOrigin
    @GetMapping("/home/{id}")
    public ResponseEntity<GuestUserInfoDTO> getGuestUserInfo(@PathVariable Integer id) {
        GuestUserInfoDTO guestUserInfo = guestUserService.findGuestUserInfoById(id);
        if (guestUserInfo != null) {
            return ResponseEntity.ok(guestUserInfo);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // 修改圖片
    @CrossOrigin
    @PutMapping("/updateHeadShot/{id}")
    public ResponseEntity<String> updateHeadShot(@PathVariable Integer id,
            @RequestParam("avatar") MultipartFile avater) {
        try {
            String updateMessage = guestUserService.updatePicture(id, avater);
            if ("圖片上傳完成".equals(updateMessage)) {
                return ResponseEntity.status(HttpStatus.CREATED).body(updateMessage);
            } else {
                return ResponseEntity.status(500).body(updateMessage);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("發生未知錯誤");
        }

    }
}