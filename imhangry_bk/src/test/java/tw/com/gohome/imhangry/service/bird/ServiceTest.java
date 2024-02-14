package tw.com.gohome.imhangry.service.bird;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ServiceTest {
    @Autowired
    private ProductService1 productService1;

    @Test
    public void testHA(){
        productService1.searchCategories(1);
        
    }
    
}
