package tw.com.gohome.imhangry.service.sean.util;

import java.net.URISyntaxException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class GetImageRelativePath {
    public static String getPath() {
        Path currentClassPath;
        try {
            currentClassPath = Paths
                    .get(GetImageRelativePath.class.getProtectionDomain().getCodeSource().getLocation().toURI())
                    .getParent();
            Path targetPath = currentClassPath.resolve(Paths.get("src", "main", "resources", "static", "images"));
            String noTargetPath = targetPath.toString().replace("/target", "").replace("\\target", "");
            return noTargetPath;
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return null;
        }
    }
}