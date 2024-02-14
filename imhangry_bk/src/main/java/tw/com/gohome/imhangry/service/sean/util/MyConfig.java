package tw.com.gohome.imhangry.service.sean.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MyConfig {
    @Value("${file.upload.path}")
    private String fileUploadPath;

    public String getFileUploadPath() {
        return fileUploadPath;
    }
}
