package tw.com.gohome.imhangry.service.sean;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import jakarta.transaction.Transactional;
import tw.com.gohome.imhangry.domain.GuestUser;
import tw.com.gohome.imhangry.repository.GuestUserRepository;
import tw.com.gohome.imhangry.service.sean.dto.GuestUserInfoDTO;
import tw.com.gohome.imhangry.service.sean.util.FileToBase64Converter;
import tw.com.gohome.imhangry.service.sean.util.GetImageRelativePath;
import tw.com.gohome.imhangry.service.sean.util.MyConfig;
import tw.com.gohome.imhangry.service.sean.util.ValidFile;

@Service
@Transactional
public class GuestUserService {
    @Autowired
    private MyConfig myConfig;

    @Autowired
    private GuestUserRepository guestUserRepository;

    // 修改會員資料
    public GuestUser guestUserInfoUpdate(Integer id, String json) {
        try {
            GuestUser existingGuestUser = guestUserRepository.findById(id).orElse(null);
            if (existingGuestUser != null) {
                JSONObject obj = new JSONObject(json);
                // 根據前端提供的 JSON 資料解析
                String name = obj.isNull("name") ? existingGuestUser.getName()
                        : obj.getString("name");
                String invoice = obj.isNull("invoice") ? existingGuestUser.getInvoice()
                        : obj.getString("invoice");

                existingGuestUser.setName(name);
                existingGuestUser.setInvoice(invoice);

                System.out.println("update=" + existingGuestUser.toString());
                return guestUserRepository.save(existingGuestUser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 會員註冊
    public GuestUser register(String json) {
        try {
            JSONObject obj = new JSONObject(json);
            String email = obj.isNull("email") ? null : obj.getString("email");
            String name = obj.isNull("name") ? null : obj.getString("name");
            String password = obj.isNull("password") ? null : obj.getString("password");
            String phone = obj.isNull("phone") ? null : obj.getString("phone");

            GuestUser insert = new GuestUser();
            insert.setEmail(email);
            insert.setName(name);
            insert.setPassword(password);
            insert.setPhone(phone);

            return guestUserRepository.save(insert);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 檢查帳號輸入格式是否為Email格式
    public boolean isValidEmailFormat(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return email.matches(emailRegex);
    }

    // guestUserId是否存在
    public boolean guestUserIdExiste(Integer id) {
        if (id != null) {
            return guestUserRepository.existsById(id);
        }
        return false;
    }

    // 帳號是否存在
    public boolean emailExists(String email) {
        if (email != null) {
            return guestUserRepository.existsByEmail(email);
        }
        return false;
    }

    // 檢查密碼強度：必須包含英數字，且強度大於8
    public boolean isPwdStrong(String password) {
        boolean hasLetter = false;
        boolean hasDigit = false;
        for (char c : password.toCharArray()) {
            if (Character.isLetter(c)) {
                hasLetter = true;
            } else if (Character.isDigit(c)) {
                hasDigit = true;
            }
            if (hasDigit && hasLetter) {
                return true;
            }
        }
        return false;
    }

    // 密碼長度至少8個字元
    public boolean pwdLength(String password) {
        if (password.length() >= 8) {
            return true;
        }
        return false;
    }

    // 姓名是否符合格式：至少兩位元且只能有中文及英文不得有特殊字元（包含空格）
    public boolean isValidName(String name) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        if (name.length() < 2 || name.length() > 20) {
            return false;
        }
        return name.matches("^[\\u4e00-\\u9fa5a-zA-Z]+$");
    }

    // 手機是否符合格式：台灣地區09開頭，或以+886開頭，後面接8個數字
    public boolean isValidPhoneNumber(String phone) {
        String phoneRegex = "^(09\\d{8}|\\+886\\d{8})$";
        return phone.matches(phoneRegex);
    }

    // 手機是否存在
    public boolean phoneExists(String phone) {
        if (phone != null) {
            return guestUserRepository.existsByPhone(phone);
        }
        return false;
    }

    // 會員登入
    public GuestUser login(String email, String password) {
        if (email != null && email.length() != 0) {
            System.err.println("4444444444444444444444444444444444444444");
            List<GuestUser> guestUserOptional = guestUserRepository.findByEmail(email);
            System.out.println("3333333333333333333333333333");
            System.err.println("guestUserOptional=" + guestUserOptional);
            if (!guestUserOptional.isEmpty()) {
                GuestUser guestUser = guestUserOptional.get(0);
                String pwd = guestUser.getPassword();
                if (password.equals(pwd)) {
                    return guestUser;
                }
            }
        }
        return null;

    }

    // SElECT MemberName MemberNickName MemberPIC MemberHeight MemberWeight
    // MemberRegion Where
    // MemberId = :MemberId
    public GuestUserInfoDTO findGuestUserInfoById(Integer id) {
        Optional<GuestUser> optionalGuestUser = guestUserRepository.findById(id);
        GuestUserInfoDTO guestUserInfo;

        if (optionalGuestUser.isPresent()) {
            GuestUser guestUsers = optionalGuestUser.get();
            String base64Image;
            if (guestUsers.getImage() != null) {
                Path FilePath = Paths.get(GetImageRelativePath.getPath(), "headshot", guestUsers.getImage());
                String imagePath = FilePath.toString();
                base64Image = FileToBase64Converter.convertFileToBase64(imagePath);
            } else {
                base64Image = null;
            }
            guestUserInfo = new GuestUserInfoDTO(
                    guestUsers.getName(),

                    base64Image,
                    guestUsers.getInvoice());

        } else {
            guestUserInfo = new GuestUserInfoDTO(null, null, null);
        }
        return guestUserInfo;
    }

    // SELECT Name FROM GuestUser Where Id=:Id
    public String findNameById(Integer id) {
        Optional<GuestUser> gu = guestUserRepository.findById(id);
        if (gu != null) {
            GuestUser guName = gu.get();
            String gunn = guName.getName();
            return gunn;
        } else {
            return null;
        }
    }

    // 上傳照片
    public String updatePicture(Integer id, MultipartFile avatar) {

        Optional<GuestUser> existingMember = guestUserRepository.findById(id);

        if (existingMember != null) {
            // 基礎路徑
            String relativePath = myConfig.getFileUploadPath();
            String appRoot = System.getProperty("user.dir");
            // 生成隨機數防止圖片重名
            String originalFileName = avatar.getOriginalFilename();
            String newFileName = UUID.randomUUID() + originalFileName;
            // 去掉隨機數生成得特殊字符
            newFileName = newFileName.replace("(", "").replace(")", "").replace("-", "");
            // 設置圖片的儲存地址
            Path newImagePath = Paths.get(GetImageRelativePath.getPath(), "headshot",
                    newFileName);
            System.err.println(newImagePath.toString());

            try {
                // 檢查文件副檔名
                String fileExtension = StringUtils.getFilenameExtension(originalFileName);
                if (!ValidFile.isValidFileExtenstion(fileExtension)) {
                    return "檔案格式不合法，請檢查檔案格式。";
                }
                // 保存新照片
                avatar.transferTo(newImagePath.toFile());
                // 刪除舊照片
                GuestUser gu = existingMember.get();
                String oldImagePath = gu.getImage();
                if (oldImagePath != null && !oldImagePath.isEmpty()) {
                    Path oldImageFile = Paths.get(GetImageRelativePath.getPath(), "headshot",
                            oldImagePath);
                    System.err.println("Old Image File Path: " + oldImageFile.toString());
                    if (Files.exists(oldImageFile)) {
                        Files.delete(oldImageFile);
                    }
                }
                // 將傳來的文件存進本地路徑後,將路徑存進資料庫
                gu.setImage(newFileName);
                guestUserRepository.save(gu);
                return "圖片上傳完成";
            } catch (IllegalStateException | IOException e) {
                // 處理其他異常
                e.printStackTrace();
                return "圖片上傳失敗";
            }
        }
        return "圖片上傳失敗";

    }

    // 檢查上傳文件的副黨名(只能是jpg,jpeg,png)
    private boolean isValidFileExtenstion(String fileExtension) {
        String[] allowedExtensions = { "jpg", "jpeg", "png" };
        for (String allowedExtension : allowedExtensions) {
            if (allowedExtension.equalsIgnoreCase(fileExtension)) {
                return true;
            }
        }
        return false;
    }

    // Find memberId By memberAccount
    public Integer getGuestUserIdByEmail(String email) {
        List<GuestUser> optionalMember = guestUserRepository.findByEmail(email);
        if (!optionalMember.isEmpty()) {
            GuestUser guestUser = optionalMember.get(0);
            return guestUser.getId();
        } else {
            return null;
        }
    }

}