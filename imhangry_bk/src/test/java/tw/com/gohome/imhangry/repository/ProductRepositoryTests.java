package tw.com.gohome.imhangry.repository;

import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import tw.com.gohome.imhangry.domain.Product;
import tw.com.gohome.imhangry.domain.dto.ProductCategoryDTO;
import tw.com.gohome.imhangry.domain.dto.ProductQuickViewDTO;
import tw.com.gohome.imhangry.domain.dto.ProductReportDTO;
import tw.com.gohome.imhangry.util.DatetimeConverter;

@SpringBootTest
public class ProductRepositoryTests {
    @Autowired
    private ProductRepository productRepository;

    @Test
    public void testFindByFkBusinessId(){
        List<Product> Products = productRepository.findByFkBusinessId(1);
        Products.forEach(System.err::println);
    
    }
    @Test
    public void testFindByFkCategoryId(){
        List<Product> Products = productRepository.findByFkCategoryId(2);
        Products.forEach(System.err::println);
    
    }

    @Test
    public void testGetCategoryByBusinessId(){
        List<ProductCategoryDTO> categoryByBusinessId = productRepository.getCategoryByBusinessId(1);
        System.err.println(categoryByBusinessId);
    }

    //gkd////////////////////////////////////////////////////////////////////////////
    @Test
    public void testFindReportByFkBusinessIdAndDate(){

        Date start = DatetimeConverter.stringToDate("2024-01-01");
        Date end = DatetimeConverter.stringToDate("2024-02-28");

        List<ProductReportDTO> result = productRepository.findReportByFkBusinessIdAndDate(1, start, end);

        System.err.println(result);
    }

    @Test
    public void testFindProductQVByFkBusinessIdAndDate(){

        Date start = DatetimeConverter.stringToDate("2024-01-01");
        Date end = DatetimeConverter.stringToDate("2024-01-31");

        List<ProductQuickViewDTO> result = productRepository.findProductQVByFkBusinessIdAndDate(1, start, end);

        System.err.println(result);
    }
}
