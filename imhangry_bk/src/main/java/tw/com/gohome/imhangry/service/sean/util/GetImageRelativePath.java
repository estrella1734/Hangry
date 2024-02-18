package tw.com.gohome.imhangry.service.sean.util;

import java.nio.file.Path;
import java.nio.file.Paths;

// public class GetImageRelativePath {
//     public static String getPath() {
//         Path currentClassPath;
//         try {
//             currentClassPath = Paths
//                     .get(GetImageRelativePath.class.getProtectionDomain().getCodeSource().getLocation().toURI())
//                     .getParent();
//             Path targetPath = currentClassPath.resolve(Paths.get("src", "main", "resources", "static", "images"));
//             String noTargetPath = targetPath.toString().replace("/target", "").replace("\\target", "");
//             return noTargetPath;
//         } catch (URISyntaxException e) {
//             e.printStackTrace();
//             return null;
//         }
//     }
// }

public class GetImageRelativePath {
    public static String getPath() {
        // Get the current working directory
        Path currentWorkingDirectory = Paths.get(System.getProperty("user.dir"));

        // Define the relative path to the images directory
        String relativeImagePath = "src/main/resources/static/images";

        // Resolve the full path to the images directory
        Path imagePath = currentWorkingDirectory.resolve(relativeImagePath);

        // Convert the path to a string and return it
        return imagePath.toString();
    }
}