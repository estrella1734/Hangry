package tw.com.gohome.imhangry.service.ys;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import jakarta.annotation.Resource;
import jakarta.persistence.Column;
import jakarta.transaction.Transactional;
import tw.com.gohome.imhangry.domain.Coupon;
import tw.com.gohome.imhangry.domain.Product;
import tw.com.gohome.imhangry.domain.dto.ProductWithImageDTO;
import tw.com.gohome.imhangry.repository.ProductRepository;
import tw.com.gohome.imhangry.service.sean.util.FileToBase64Converter;
import tw.com.gohome.imhangry.service.sean.util.GetImageRelativePath;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductRepository productRepository;

    @Override
    public List<Product> findByFkBusinessId(Integer fkBusinessId) {

        if (fkBusinessId != null) {

            List<Product> products = productRepository.findByFkBusinessId(fkBusinessId);
            List<ProductWithImageDTO> productDTOs = new ArrayList<>();

            for (Product product : products) {

                try {
                    if (product.getImage() != null && !product.getImage().isEmpty()) {

                        String imagePath = Paths.get(GetImageRelativePath.getPath(), "headshot", product.getImage())
                                .toString();
                        System.out.println("Image Path: " + imagePath);

                        String base64Image = FileToBase64Converter.convertFileToBase64(imagePath);

                        ProductWithImageDTO productDTO = new ProductWithImageDTO(
                                product.getName(),
                                product.getEngName(),
                                product.getFkCategoryId(),
                                product.getPrice(),
                                product.getStatus(),
                                product.getDescription(),
                                base64Image);

                        productDTOs.add(productDTO);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    System.err.println("Error processing product: " + e.getMessage());
                }
            }
            return products;
        }
        return null;
    }

    @Override
    public Optional<Product> findByProductId(Integer productId) {
        if (productId != null) {
            return productRepository.findById(productId);
        }
        return null;
    }

    @Override
    public Product deleteProductById(Integer id) {
        productRepository.deleteById(id);
        return null;
    }

    @Override
    public Product updateProductById(Integer id, Product updatedProduct) {

        Optional<Product> optionalProduct = productRepository.findById(id);

        if (optionalProduct.isPresent()) {
            Product existingProduct = optionalProduct.get();
            // 更新商品屬性
            existingProduct.setName(updatedProduct.getName());
            existingProduct.setEngName(updatedProduct.getEngName());
            existingProduct.setFkCategoryId(updatedProduct.getFkCategoryId());
            existingProduct.setPrice(updatedProduct.getPrice());
            existingProduct.setStatus(updatedProduct.getStatus());
            existingProduct.setDescription(updatedProduct.getDescription());
            existingProduct.setImage(updatedProduct.getImage());
            ;
            // ... 其他要更新的屬性

            // 保存更新後的商品
            return productRepository.save(existingProduct);
        } else {
            // 如果商品不存在，可以選擇拋出異常或返回 null 或其他適當的值
            return null;
        }
    }

    @Override
    public String updateProduct(
            Integer id,
            String name,
            String engName,
            Integer fkCategoryId,
            Integer price,
            Integer status,
            String description, MultipartFile image) {

        Optional<Product> optionalProduct = productRepository.findById(id);
        if (optionalProduct.isPresent()) {
            Product existingProduct = optionalProduct.get();

            // 檢查是否滿足特定條件來初始化pd
            if (name != null && !name.isEmpty() && fkCategoryId != null && price != null && status != null) {

                // 生成隨機數防止圖片重名
                String originalFileName = image.getOriginalFilename();
                String newFileName = UUID.randomUUID() + originalFileName;
                // 去掉隨機數生成得特殊字符
                newFileName = newFileName.replace("(", "").replace(")", "").replace("-", "");
                // 設置圖片的儲存地址
                Path newImagePath = Paths.get(GetImageRelativePath.getPath(), "headshot", newFileName);
                System.err.println(newImagePath.toString());

                try {
                    // 檢查文件副檔名
                    String fileExtension = StringUtils.getFilenameExtension(originalFileName);
                    if (!isValidFileExtenstion(fileExtension)) {
                        return "檔案格式不合法，請檢查檔案格式。";
                    }
                    // 保存新照片
                    image.transferTo(newImagePath.toFile());

                    // 將傳來的文件存進本地路徑後,將路徑存進資料庫
                    existingProduct.setId(id);
                    existingProduct.setImage(newFileName);
                    existingProduct.setName(name);
                    existingProduct.setEngName(engName);
                    existingProduct.setFkCategoryId(fkCategoryId);
                    existingProduct.setPrice(price);
                    existingProduct.setStatus(status);
                    existingProduct.setDescription(description);
                    productRepository.save(existingProduct);
                    return "圖片上傳完成";
                } catch (IllegalStateException | IOException e) {
                    // 處理其他異常
                    e.printStackTrace();
                    return "圖片上傳失敗";
                }
            }
        }
        return "初始化Product對象失敗，請檢查輸入參數。";
    }

    @Override
    public String saveProduct(
            Integer fkBusinessId,
            String name,
            String engName,
            Integer fkCategoryId,
            Integer price,
            Integer status,
            String description, MultipartFile image) {

        // 檢查是否滿足特定條件來初始化pd
        if (name != null && !name.isEmpty() && fkCategoryId != null && price != null && status != null) {
            Product pd = new Product();

            // 生成隨機數防止圖片重名
            String originalFileName = image.getOriginalFilename();
            String newFileName = UUID.randomUUID() + originalFileName;
            // 去掉隨機數生成得特殊字符
            newFileName = newFileName.replace("(", "").replace(")", "").replace("-", "");
            // 設置圖片的儲存地址
            Path newImagePath = Paths.get(GetImageRelativePath.getPath(), "headshot", newFileName);
            System.err.println(newImagePath.toString());

            try {
                // 檢查文件副檔名
                String fileExtension = StringUtils.getFilenameExtension(originalFileName);
                if (!isValidFileExtenstion(fileExtension)) {
                    return "檔案格式不合法，請檢查檔案格式。";
                }
                // 保存新照片
                image.transferTo(newImagePath.toFile());

                // 將傳來的文件存進本地路徑後,將路徑存進資料庫
                pd.setFkBusinessId(fkBusinessId);
                pd.setImage(newFileName);
                pd.setName(name);
                pd.setEngName(engName);
                pd.setFkCategoryId(fkCategoryId);
                pd.setPrice(price);
                pd.setStatus(status);
                pd.setDescription(description);
                productRepository.save(pd);
                return "圖片上傳完成";
            } catch (IllegalStateException | IOException e) {
                // 處理其他異常
                e.printStackTrace();
                return "圖片上傳失敗";
            }
        }
        return "初始化Product對象失敗，請檢查輸入參數。";
    }

    // 檢查上傳文件的副檔名(只能是jpg,jpeg,png)
    @Override
    public boolean isValidFileExtenstion(String fileExtension) {
        String[] allowedExtensions = { "jpg", "jpeg", "png" };
        for (String allowedExtension : allowedExtensions) {
            if (allowedExtension.equalsIgnoreCase(fileExtension)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void saveProductsFromCsv(InputStream inputStream) throws IOException {
        try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
                CSVParser csvParser = new CSVParser(fileReader,
                        CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim())) {

            List<Product> products = new ArrayList<>();

            Iterable<CSVRecord> csvRecords = csvParser.getRecords();

            for (CSVRecord csvRecord : csvRecords) {
                Product product = new Product();
                // 設定 fkBusinessId
                product.setFkBusinessId(Integer.parseInt(csvRecord.get("fkBusinessId")));
                // 設定 fkCategoryId
                product.setFkCategoryId(Integer.parseInt(csvRecord.get("fkCategoryId")));
                // 設定 name
                String name = csvRecord.get("name");
                product.setName(name != null && !name.isEmpty() ? name : null);
                // 設定 engName
                String engName = csvRecord.get("engName");
                product.setEngName(engName != null && !engName.isEmpty() ? engName : null);
                // 設定 price
                product.setPrice(Integer.parseInt(csvRecord.get("price")));
                // 設定 status
                product.setStatus(Integer.parseInt(csvRecord.get("status")));
                // 設定 engName
                String description = csvRecord.get("description");
                product.setDescription(description != null && !description.isEmpty() ? description : null);

                products.add(product);
            }

            productRepository.saveAll(products);
        }
    }

}
