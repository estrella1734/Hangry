package tw.com.gohome.imhangry.service.sean.util;

public class ValidFile {

    public static boolean isValidFileExtenstion(String fileExtension) {
        String[] allowedExtensions = { "jpg", "jpeg", "png" };
        for (String allowedExtension : allowedExtensions) {
            if (allowedExtension.equalsIgnoreCase(fileExtension)) {
                return true;
            }
        }
        return false;
    }
}