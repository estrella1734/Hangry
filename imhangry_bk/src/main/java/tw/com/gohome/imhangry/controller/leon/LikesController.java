package tw.com.gohome.imhangry.controller.leon;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.domain.Likes;
import tw.com.gohome.imhangry.repository.LikesRepository;
import tw.com.gohome.imhangry.service.leon.LikesService;

@RestController
@RequestMapping("/")
@CrossOrigin
public class LikesController {
    @Autowired
    private LikesService likesService;
    @Autowired
    LikesRepository likesRepository;

    @PostMapping("likesExist")
    public boolean likeExist(@RequestBody String body) {
        JSONObject obj = new JSONObject(body);
        System.err.println("body = " + body);
        Integer guestId = obj.isNull("fk_guest_id") ? null : obj.getInt("fk_guest_id");
        Integer busId = obj.isNull("fk_business_id") ? null : obj.getInt("fk_business_id");
        System.err.println("guestId = " + guestId);
        System.err.println("busId = " + busId);
        if (likesRepository.existLikes(busId, guestId) == null) {
            System.err.println(likesRepository.existLikes(busId, guestId));
            return true;
        } else {
            System.err.println(likesRepository.existLikes(busId, guestId));
            return false;
        }

    }

    @GetMapping("likesPage/{guestId}")
    public String getAllLikes(@PathVariable(name = "guestId") Integer guestId) {

        return likesService.findBusinessByLikes(guestId);
    }

    @PostMapping("likes")
    public Likes likeFunction(@RequestBody String body) {
        return likesService.Create(body);
    }

}
