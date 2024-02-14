package tw.com.gohome.imhangry.service.bird;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.gohome.imhangry.domain.Product;
import tw.com.gohome.imhangry.domain.dto.ProductCategoryDTO;
import tw.com.gohome.imhangry.repository.ProductRepository;

@Service
@Transactional
public class ProductService1 {
    @Autowired
    private ProductRepository productRepository;

    public List<Map<String,Object>> searchCategories(Integer id){
        if(id != null){
            
            List<ProductCategoryDTO> categories = productRepository.getCategoryByBusinessId(id);
            if(categories != null && !categories.isEmpty()){
                
                List<Map<String,Object>> result = new ArrayList<>();
                categories.forEach(item->{
                    Integer categoryId = item.getCategoryId();
                        if(categoryId != null){
                            List<Product> temProducts = productRepository.findByFkCategoryIdAndFkBusinessId(categoryId,id);
                            Map<String,Object> temMap = new HashMap<>();
                            temMap.put("products", temProducts);
                            temMap.put("id", categoryId);
                            temMap.put("categoryName", item.getCategoryName());
                            result.add(temMap);
                        }
                    }
                );
        
                return result;
            }
        }
        return null;
    }
}
