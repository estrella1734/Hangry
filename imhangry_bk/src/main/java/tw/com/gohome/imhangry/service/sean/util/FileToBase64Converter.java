package tw.com.gohome.imhangry.service.sean.util;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Base64;

public class FileToBase64Converter {
    public static String convertFileToBase64(String filePath) {
        try {
            Path path = Path.of(filePath);
            byte[] fileContent = Files.readAllBytes(path);
            return Base64.getEncoder().encodeToString(fileContent);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
