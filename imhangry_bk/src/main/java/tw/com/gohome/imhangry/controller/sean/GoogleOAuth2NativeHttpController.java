package tw.com.gohome.imhangry.controller.sean;

import java.io.IOException;
import java.util.Base64;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tw.com.gohome.imhangry.config.GoogleOauthConfig;
import tw.com.gohome.imhangry.service.sean.GuestUserService;

@Controller
public class GoogleOAuth2NativeHttpController {
    // 原生使用(okhttp) http request, response 執行 OAuth2 的寫法
    @Autowired
    private GuestUserService guestUserService;

    @Autowired
    private GoogleOauthConfig googleOauth2Config;

    @Autowired
    private RestTemplate restTemplate;

    private final String scope = "https://www.googleapis.com/auth/userinfo.email";

    @GetMapping("/google-login")
    public String googleLogin(HttpServletResponse response) {

        // 直接 redirect 導向 Google OAuth2 API
        String authUrl = "https://accounts.google.com/o/oauth2/v2/auth?" +
                "client_id=" + googleOauth2Config.getClientId() +
                "&response_type=code" +
                "&scope=openid%20email%20profile" +
                "&redirect_uri=" + googleOauth2Config.getRedirectUri() +
                "&state=state";
        return "redirect:" + authUrl;
    }

    @GetMapping("/google-callback")
    public String oauth2Callback(@RequestParam(required = false) String code,
            HttpSession httpSession,
            HttpServletResponse response)
            throws IOException {
        String email = null;
        Integer id = null;
        if (code == null) {
            String authUri = "https://accounts.google.com/o/oauth2/v2/auth?response_type=code" +
                    "&client_id=" + googleOauth2Config.getClientId() +
                    "&redirect_uri=" + googleOauth2Config.getRedirectUri() +
                    "&scope=" + scope;
            return "redirect:" + authUri;
        } else {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

            MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
            // key可能重複再用
            map.add("code", code);
            map.add("client_id", googleOauth2Config.getClientId());
            map.add("client_secret", googleOauth2Config.getClientSecret());
            map.add("redirect_uri", googleOauth2Config.getRedirectUri());
            map.add("grant_type", "authorization_code");

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map,
                    headers);

            ResponseEntity<String> tokenResponseEntity = restTemplate.postForEntity(
                    "https://oauth2.googleapis.com/token",
                    request,
                    String.class);
            if (tokenResponseEntity.getStatusCode().is2xxSuccessful()) {
                String tokenResponseBody = tokenResponseEntity.getBody();
                JsonNode tokenJsonNode = new ObjectMapper().readTree(tokenResponseBody);

                String acessToken = tokenJsonNode.get("access_token").asText();

                HttpHeaders userHeaders = new HttpHeaders();
                userHeaders.setBearerAuth(acessToken);

                HttpEntity<String> userEntity = new HttpEntity<>(userHeaders);
                ResponseEntity<String> userResponseEntity = restTemplate.exchange(
                        "https://www.googleapis.com/oauth2/v1/userinfo?alt=json",
                        HttpMethod.GET,
                        userEntity,
                        String.class);
                if (userResponseEntity.getStatusCode().is2xxSuccessful()) {
                    String userResponseBody = userResponseEntity.getBody();
                    JsonNode userJsonNode = new ObjectMapper().readTree(userResponseBody);
                    System.out.println("userJsonNode:" + userJsonNode);
                    JSONObject responseJson = new JSONObject();
                    // 從用戶資料中提取用戶的memberAccount(Email)
                    JsonNode emailNode = userJsonNode.get("email");
                    if (emailNode != null && !emailNode.isNull()) {
                        email = emailNode.asText();
                        // 根據google提供的資料查找資料庫中的memberId
                        id = guestUserService.getGuestUserIdByEmail(email);
                        System.out.println("memberID" + id);
                        // if (memberId == null) {
                        // Members member = membersService.saveUserInfo(
                        // memberAccount,
                        // userJsonNode.get("name").asText(),
                        // userJsonNode.get("phone").asText());
                        // System.out.println("memberAccount" + memberAccount);
                        // responseJson.put("message", "新用戶註冊並成功登錄");
                        // memberId = member.getMemberId();
                        // System.out.println("memberId" + memberId);
                        // } else {
                        // }
                    }

                    // 將 memberId 和 memberAccount 存進 cookie
                    JSONObject memberData = new JSONObject();
                    memberData.put("id", id);
                    memberData.put("email", email);
                    // 序列化成JSON格式
                    String jsonData = memberData.toString();
                    // 使用Base64編碼
                    jsonData = Base64.getEncoder().encodeToString(jsonData.getBytes());
                    // jsonData = Base64.getEncoder().encodeToString(jsonData.getBytes());
                    // 將jsonData存入名為userData的Cookie
                    Cookie memberCookie = new Cookie("userData", jsonData);
                    // 設定Cookie有效時間，單位為秒
                    memberCookie.setMaxAge(24 * 60 * 60);
                    // 設定Cookie的作用範圍
                    memberCookie.setPath("/");
                    // 將Cookie加入到Response中
                    response.addCookie(memberCookie);
                    responseJson.put("message", "登入成功");
                    responseJson.put("success", "true");

                }
            }
        }
        return "redirect:http://localhost:5173/";
    }

}
