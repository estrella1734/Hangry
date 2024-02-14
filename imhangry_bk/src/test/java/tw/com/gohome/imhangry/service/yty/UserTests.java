package tw.com.gohome.imhangry.service.yty;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UserTests {
    @Autowired
    private UserServiceImpl aaa;

    @Test
    public void findbyID(){
        
        // System.err.println("aaa"+aaa.findById(1));

        
    }
}
