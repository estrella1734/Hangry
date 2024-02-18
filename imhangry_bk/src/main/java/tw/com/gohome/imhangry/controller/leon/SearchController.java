package tw.com.gohome.imhangry.controller.leon;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.domain.Brand;
import tw.com.gohome.imhangry.domain.BusinessUser;
import tw.com.gohome.imhangry.domain.dto.BrandResultDTO;
import tw.com.gohome.imhangry.repository.BrandRepository;
import tw.com.gohome.imhangry.repository.BusinessUserRepository;

@RestController
@RequestMapping("/")
@CrossOrigin
public class SearchController {
    @Autowired
    BusinessUserRepository businessUserRepository;
    @Autowired
    BrandRepository brandRepository;

    @GetMapping("SearchType/{busType}")
    public String getBusByType(@PathVariable(name = "busType") String busType) {
        Integer index = 0;
        JSONObject responseJson = new JSONObject();
        JSONArray array = new JSONArray();
        List<BusinessUser> typeResult = businessUserRepository.findByType(busType);
        if (typeResult != null && !typeResult.isEmpty()) {
            for (BusinessUser result : typeResult) {
                JSONObject object = new JSONObject()
                        .put("id", result.getId())
                        .put("businessUserName", result.getName())
                        .put("openTime", result.getOperationTime())
                        .put("rate", result.getRate())
                        .put("address", result.getAddress())
                        .put("icon", result.getImageIcon())
                        .put("dist", result.getDist())
                        .put("city", result.getCity())
                        .put("index", index);
                array = array.put(object);
                index++;
            }
        }
        responseJson.put("list", array);
        return responseJson.toString();
    }

    @GetMapping("SearchBrand/{busBrand}")
    public String getBusByBrand(@PathVariable(name = "busBrand") String busBrand) {
        Integer index = 0;
        JSONObject responseJson = new JSONObject();
        JSONArray array = new JSONArray();
        List<BrandResultDTO> brandResult = businessUserRepository.findByBrand(busBrand);
        if (brandResult != null) {
            for (int i = 0; i < brandResult.size(); i++) {
                JSONObject object = new JSONObject()
                        .put("id", brandResult.get(i).getId())
                        .put("businessUserName", brandResult.get(i).getName())
                        .put("openTime", brandResult.get(i).getOperationTime())
                        .put("rate", brandResult.get(i).getRate())
                        .put("address", brandResult.get(i).getAddress())
                        .put("icon", brandResult.get(i).getImageIcon())
                        .put("dist", brandResult.get(i).getDist())
                        .put("city", brandResult.get(i).getCity())
                        .put("index", index);
                array = array.put(object);
                index++;
            }

        }
        responseJson.put("list", array);
        return responseJson.toString();
    }

    @GetMapping("findBusinessType")
    public String findBusinessType() {
        JSONObject responseJson = new JSONObject();
        JSONArray array = new JSONArray();
        List<BusinessUser> allBusinessType = businessUserRepository.findAll();
        List allType = businessUserRepository.findAllType();
        if (allType != null && !allType.isEmpty()) {
            for (int i = 0; i < allType.size(); i++) {
                JSONObject object = new JSONObject().put("Value", allType.get(i));
                array = array.put(object);
            }
            responseJson.put("list", array);
            return responseJson.toString();
        } else {
            return null;
        }
    }

    @GetMapping("findBusinessBrand")
    public String findBusinessBrand() {
        JSONObject responseJson = new JSONObject();
        JSONArray array = new JSONArray();
        List<Brand> allBrand = brandRepository.findAll();
        if (allBrand != null && !allBrand.isEmpty()) {
            for (Brand brand : allBrand) {
                JSONObject object = new JSONObject().put("Value", brand.getName());
                array = array.put(object);
            }
            responseJson.put("list", array);
            return responseJson.toString();
        } else {
            return null;
        }
    }

    @GetMapping("SearchNearby/{dist}")
    public String getNearby(@PathVariable(name = "dist") String dist) {
        JSONObject responseJson = new JSONObject();
        JSONArray array = new JSONArray();
        Integer index = 0;
        List<BusinessUser> distResult = businessUserRepository.findByDist(dist);
        System.err.println(distResult);
        if (distResult != null && !distResult.isEmpty()) {
            for (BusinessUser result : distResult) {
                JSONObject object = new JSONObject()
                        .put("id", result.getId())
                        .put("businessUserName", result.getName())
                        .put("openTime", result.getOperationTime())
                        .put("rate", result.getRate())
                        .put("address", result.getAddress())
                        .put("icon", result.getImageIcon())
                        .put("city", result.getCity())
                        .put("dist", result.getDist())
                        .put("index", index);
                index++;
                array = array.put(object);
            }
            responseJson.put("list", array);

            return responseJson.toString();
        } else {
            return null;
        }
    }
}
