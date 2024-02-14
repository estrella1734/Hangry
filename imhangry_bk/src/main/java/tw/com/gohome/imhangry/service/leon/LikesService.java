package tw.com.gohome.imhangry.service.leon;

import java.util.List;
import java.util.Optional;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import tw.com.gohome.imhangry.domain.BusinessUser;
import tw.com.gohome.imhangry.domain.Likes;
import tw.com.gohome.imhangry.repository.BusinessUserRepository;
import tw.com.gohome.imhangry.repository.LikesRepository;

@Service
@Transactional
public class LikesService {
    @Autowired
    private LikesRepository likesRepository = null;
    @Autowired
    BusinessUserRepository businessUserRepository;

    public String findBusinessByLikes(Integer guestId) {
        JSONArray array = new JSONArray();
        JSONObject responseJson = new JSONObject();
        Integer index = 0;
        List<Likes> allLikes = likesRepository.findAllLikes(guestId);
        System.err.println(allLikes);
        for (Likes likes : allLikes) {
            JSONObject object = new JSONObject();
            Optional<BusinessUser> businessByLike = businessUserRepository.findById(likes.getFkBusinessId());
            BusinessUser businessUser = businessByLike.get();
            object.put("id", businessUser.getId())
                    .put("businessUserName", businessUser.getName())
                    .put("openTime", businessUser.getOperationTime())
                    .put("rate", businessUser.getRate())
                    .put("address", businessUser.getAddress())
                    .put("icon", businessUser.getImageIcon())
                    .put("city", businessUser.getCity())
                    .put("dist", businessUser.getDist())
                    .put("index", index);
            index++;
            array = array.put(object);
        }
        responseJson.put("list", array);
        return responseJson.toString();
    }

    public Likes Create(String body) {

        JSONObject obj = new JSONObject(body);
        System.err.println(body);
        Integer guestId = obj.isNull("fk_guest_id") ? null : obj.getInt("fk_guest_id");
        Integer busId = obj.isNull("fk_business_id") ? null : obj.getInt("fk_business_id");
        // System.err.println(likesRepository.existLikes(busId, guestId));
        if (likesRepository.existLikes(busId, guestId) == null) {
            if (guestId != null && busId != null) {
                Likes likes = new Likes();
                likes.setFkGuestId(guestId);
                likes.setFkBusinessId(busId);
                return likesRepository.save(likes);
            }
        } else {
            Likes likes = new Likes();
            likes.setFkGuestId(guestId);
            likes.setFkBusinessId(busId);
            likesRepository.delete(likes);
            return null;
        }
        return null;
    }

}
