package tw.com.gohome.imhangry.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.com.gohome.imhangry.domain.OrderDetail;
import tw.com.gohome.imhangry.domain.dto.OrderDetailTodayDTO;
import tw.com.gohome.imhangry.repository.declaredinterfaces.OrderDetailRepositoryCustom;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>, OrderDetailRepositoryCustom {

    // 第三步->宣告介面繼承 JpaRepository<Bean,Id>，自定義的介面。其中
    // Bean為要操作的table的java類別。Id為此table的主鍵的資料型態，之後用此介面實例操作資料庫。

    //Timothy//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @Query("FROM OrderDetail WHERE  fkOrderId =:fkOrderId")
    List<OrderDetail> findDetailByOrderId(@Param("fkOrderId") Integer id);
    

    //gkd//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /**
     * 此方法暫時停用
     * 預計從session拿出BusinessID，藉由此組ID可以在今日概覽的card上顯示使用者的產品簡易資訊
     * //TODO透過回傳資料，前端可以簡易運算產品增長率
     * 
     * @param Integer BusinessID
     * @return List <OrderDetailTodayDTO>
     */
    @Query("""
        SELECT new tw.com.gohome.imhangry.domain.dto.OrderDetailTodayDTO(
        p.name,
        od.amount, 
        ofm.time, 
        p.status)
        FROM OrderDetail od
        JOIN Product p ON od.fkProductId = p.id
        JOIN OrderForm ofm ON od.fkOrderId = ofm.id
        WHERE ofm.fkBusinessId = :businessId
        """)
    List<OrderDetailTodayDTO> findOrderDetailByBusinessId(@Param("businessId") Integer businessId);

}
