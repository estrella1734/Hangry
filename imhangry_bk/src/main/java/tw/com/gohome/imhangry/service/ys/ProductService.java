package tw.com.gohome.imhangry.service.ys;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import tw.com.gohome.imhangry.domain.Product;

public interface ProductService {
        String saveProduct(
                        Integer fkBusinessId,
                        String name,
                        String engName,
                        Integer fkCategoryId,
                        Integer price,
                        Integer status,
                        String description, MultipartFile image);

        String updateProduct(
                        Integer id,
                        String name,
                        String engName,
                        Integer fkCategoryId,
                        Integer price,
                        Integer status,
                        String description, MultipartFile image);

        List<Product> findByFkBusinessId(Integer fkBusinessId);

        Optional<Product> findByProductId(Integer productId);

        Product deleteProductById(Integer id);

        Product updateProductById(Integer id, Product updatedProduct);

        boolean isValidFileExtenstion(String fileExtension);

        void saveProductsFromCsv(InputStream inputStream) throws IOException;

}
