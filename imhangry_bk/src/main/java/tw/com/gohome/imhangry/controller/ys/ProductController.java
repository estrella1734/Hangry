package tw.com.gohome.imhangry.controller.ys;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import tw.com.gohome.imhangry.domain.Product;
import tw.com.gohome.imhangry.service.ys.ProductService;

@RestController
@RequestMapping("/product")
@CrossOrigin
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/all/{buId}")
    public ResponseEntity<?> getProductByBuId(@PathVariable(name = "buId") Integer buId) {
        try {
            if (buId != null) {
                List<Product> productDetail = productService.findByFkBusinessId(buId);
                if (!productDetail.isEmpty()) {
                    return ResponseEntity.ok().body(productDetail);
                } else {
                    return ResponseEntity.noContent().build();
                }
            } else {
                return ResponseEntity.badRequest().body("Invalid buId. It cannot be null.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("An error occurred while processing the request.");
        }
        // if (buId != null) {
        // List<Product> productDetail = productService.findByFkBusinessId(buId);
        // return ResponseEntity.ok().body(productDetail);
        // }
        // return ResponseEntity.noContent().build();
    }

    @GetMapping("/fetch/{buId}/{productId}")
    public ResponseEntity<Product> getProductById(@PathVariable Integer productId) {
        try {
            // Call the service method to find the product by ID
            Optional<Product> product = productService.findByProductId(productId);

            // Check if the product was found
            if (product.isPresent()) {
                return ResponseEntity.ok(product.get());
            } else {
                // If product is not found, return 404 Not Found
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            // Handle any exception that might occur during the process
            return ResponseEntity.status(500).build(); // Internal Server Error
        }
    }

    @DeleteMapping("/delete/{buId}/{productId}")
    public ResponseEntity<?> deleteProduct(@PathVariable Integer productId) {
        productService.deleteProductById(productId);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @PutMapping(value = "/update/{buId}/{productId}", consumes = "multipart/form-data")
    public ResponseEntity<String> updateProduct(
            @PathVariable Integer productId,
            @RequestParam String name,
            @RequestParam String engName,
            @RequestParam Integer fkCategoryId,
            @RequestParam Integer price,
            @RequestParam Integer status,
            @RequestParam String description,
            @RequestParam("image") MultipartFile image) {
        if (productId != null) {
            try {
                String pd = productService.updateProduct(productId, name, engName, fkCategoryId, price, status,
                        description, image);
                if ("圖片上傳完成".equals(pd)) {
                    return ResponseEntity.status(HttpStatus.CREATED).body(pd);
                } else {
                    return ResponseEntity.status(500).body(pd);
                }
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("發生未知錯誤");
            }

        }
        return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
    }

    @PostMapping(value = "/upload/{fkBusinessId}", consumes = "multipart/form-data")
    public ResponseEntity<String> uploadProduct(@PathVariable Integer fkBusinessId,
            @RequestParam String name,
            @RequestParam String engName,
            @RequestParam Integer fkCategoryId,
            @RequestParam Integer price,
            @RequestParam Integer status,
            @RequestParam String description,
            @RequestParam("image") MultipartFile image) {
        try {
            String pd = productService.saveProduct(fkBusinessId, name, engName, fkCategoryId, price, status,
                    description, image);
            if ("圖片上傳完成".equals(pd)) {
                return ResponseEntity.status(HttpStatus.CREATED).body(pd);
            } else {
                return ResponseEntity.status(500).body(pd);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("發生未知錯誤");
        }

    }

    @PostMapping("/upload/file/{buId}")
    public ResponseEntity<String> uploadCsvFile(@RequestParam("file") MultipartFile file) {
        try {
            productService.saveProductsFromCsv(file.getInputStream());
            return ResponseEntity.status(HttpStatus.OK).body("CSV file uploaded successfully!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error during CSV file upload!");
        }
    }
}
