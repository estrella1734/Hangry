package tw.com.gohome.imhangry.repository;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.gohome.imhangry.domain.BusinessUser;
import tw.com.gohome.imhangry.domain.dto.BusinessUserOrderPageDTO;
import tw.com.gohome.imhangry.domain.dto.HomeBuInfoDTO;

@SpringBootTest
public class BusinessUserRepositoryTests {

    @Autowired
    private BusinessUserRepository businessUserRepository;

    @Test
    public void testFindUser() {

        BusinessUserOrderPageDTO user = businessUserRepository.findUser(1);
        System.out.println(user);
    }

    @Test
    public void testFindById() {
        Optional<BusinessUser> user = businessUserRepository.findById(1);
        System.err.println(user);

    }

    @Test
    public void testSave() {
        Optional<BusinessUser> result = businessUserRepository.findById(16);

        if (result.isPresent()) {
            BusinessUser user = result.get();

            // 修改 BusinessUser 的某些屬性
            // 例如，更新用戶的名稱或其他欄位
            user.setName("新名稱");
            // ... 其他屬性的修改

            // 使用 save 方法保存修改
            BusinessUser updatedUser = businessUserRepository.save(user);
            // 檢查更新後的結果，例如可以比較更新前後的屬性值
            assert "新名稱".equals(updatedUser.getName());
        } else {
            // 如果沒有找到 BusinessUser，處理未找到的情況
            System.err.println("未找到 ID BusinessUser");
        }
    }

    //@Test
    public void testFindAllBusinessUser(){
        List<BusinessUser> beans = businessUserRepository.findAll();

        System.err.println(beans);
    }

    @Test
    public void testFindAllBusinessUserDTO(){
        List<HomeBuInfoDTO> beans = businessUserRepository.findAllDTO();

        System.err.println(beans);
    }
}
