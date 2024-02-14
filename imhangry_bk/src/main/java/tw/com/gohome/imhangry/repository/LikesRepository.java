package tw.com.gohome.imhangry.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.com.gohome.imhangry.domain.Likes;
import tw.com.gohome.imhangry.repository.declaredinterfaces.LikesRepositoryCustom;

public interface LikesRepository extends JpaRepository<Likes, Integer>, LikesRepositoryCustom {

    // 第三步
    // 宣告介面繼承 JpaRepository<Bean,Id> , 自定義的介面
    // 其中 Bean為 要操作的table的java類別
    // Id為 此table的主鍵的資料型態
    @Query("FROM Likes WHERE fkBusinessId = :fkBusinessId AND fkGuestId =:fkGuestId")
    Likes existLikes(@Param("fkBusinessId") Integer fkBusinessId, @Param("fkGuestId") Integer fkGuestId);

    @Query("FROM Likes WHERE fkGuestId=:fkGuestId")
    List<Likes> findAllLikes(@Param("fkGuestId") Integer fkGuestId);
    // 之後用此介面實例操作資料庫

}
