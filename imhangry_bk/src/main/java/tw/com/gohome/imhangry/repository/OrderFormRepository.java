package tw.com.gohome.imhangry.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Temporal;
import org.springframework.data.repository.query.Param;

import jakarta.persistence.TemporalType;
import tw.com.gohome.imhangry.domain.OrderForm;
import tw.com.gohome.imhangry.domain.dto.OrderFormManagementDTO;
import tw.com.gohome.imhangry.domain.dto.OrderManagerDTO;
import tw.com.gohome.imhangry.domain.dto.UserIdByDetail;
import tw.com.gohome.imhangry.repository.declaredinterfaces.OrderFormRepositoryCustom;

public interface OrderFormRepository extends JpaRepository<OrderForm, Integer>, OrderFormRepositoryCustom {

    // Timothy/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @Query("FROM OrderForm WHERE  fkGuestId =:fkGuestId")
    List<OrderForm> findByfkGuestId(@Param("fkGuestId") Integer id);

    @Query("""
            SELECT new tw.com.gohome.imhangry.domain.dto.UserIdByDetail(
            of.fkBusinessId,
            of.fkGuestId
            )
            FROM OrderForm
            of JOIN
            OrderDetail od
            on of.id=
            od.fkOrderId WHERE od.id=:fkOrderId
            """)
    UserIdByDetail findUserIdFromOrderId(@Param("fkOrderId") Integer id);

    // gkd/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     * 1.
     * 此方法應用於前端今日店務->本日訂單數
     * 此方法透過外部給予當日日期區間，可以回傳查看規範區間的訂單總額，讓使用者可以了解營業額現況
     * 提取的資料庫欄位是OrderForm下Total欄位
     * 
     * @param JSONObject("startDate","endDate")
     * @return List<Long>
     */
    @Query("SELECT total FROM OrderForm WHERE time >= :startDate And time < :endDate AND fkBusinessId = :fkBusinessId")
    List<Long> findTotalByTimeDay(
            @Param("startDate") @Temporal(TemporalType.DATE) Date startDate,
            @Param("endDate") @Temporal(TemporalType.DATE) Date endDate,
            @Param("fkBusinessId") Integer fkBusinessId);

    /**
     * 2.
     * 此方法應用於前端今日店務->已付款比率
     * 此方法透過外部給予當日日期區間，可以回傳查看規範區間的訂單付款狀況
     * 提取的資料庫欄位是OrderForm下payment_status欄位
     * 要抓出的欄位名稱要與bean內的型別後方名稱一致，不可為資料庫內名稱
     * 
     * @param JSONObject("startDate","endDate")
     * @return List<Integer>
     */
    // TODO放入buid
    @Query("SELECT paymentStatus FROM OrderForm WHERE time >= :startDate And time < :endDate AND fkBusinessId = :fkBusinessId")
    List<Integer> findPSByTimeDay(
            @Param("startDate") @Temporal(TemporalType.DATE) Date startDate,
            @Param("endDate") @Temporal(TemporalType.DATE) Date endDate,
            @Param("fkBusinessId") Integer fkBusinessId);

    /**
     * 3.
     * 此方法應用於前端今日概況->PieChart
     * 透過session提取出的buId可以抓出該使用者的訂單的客戶付款方式，藉由付款方式繪製圓餅圖
     * 回傳List<String>
     * 
     * @param Integer businessId
     * @return List<String>
     */
    @Query("SELECT paymentType FROM OrderForm WHERE fkBusinessId = :fkBusinessId")
    List<String> findPaymentTypeByFkBusinessId(@Param("fkBusinessId") Integer fkBusinessId);

    /**
     * 4.
     * 此方法應用於前端今日概況->PieChart
     * 透過session提取出的buId可以抓出該使用者的訂單的客戶付款方式，藉由付款方式繪製圓餅圖
     * 透過傳入的日期區間可以抓出這個區間的訂單付款方式
     * 
     * 回傳List<String>
     * 
     * @param Integer fkGuestId, Date startDate, Date endDate
     * @return List<String>
     */
    @Query("SELECT paymentType FROM OrderForm WHERE fkBusinessId = :fkBusinessId AND time >= :startDate And time < :endDate ")
    List<String> findPaymentTypeByFkBusinessIdAndDate(
            @Param("fkBusinessId") Integer fkBusinessId,
            @Param("startDate") @Temporal(TemporalType.DATE) Date startDate,
            @Param("endDate") @Temporal(TemporalType.DATE) Date endDate);

    /**
     * 5.
     * 此方法應用於前端訂單管理
     * 透過session取出的buId可以抓出該使用者的訂單，藉由這些資訊檢視訂單
     * table必須以大駝峰寫法
     * 
     * @param fkBusinessId
     * @return List<OrderManagerDTO>
     */
    @Query("""
        select new tw.com.gohome.imhangry.domain.dto.OrderManagerDTO(OFM.id id, OFM.address AS address, OFM.paymentType AS paymentType, OD.fkProductId AS fkProductId, OD.amount AS amount, OD.price AS price, OD.image AS image, OD.name AS name)
        from OrderForm OFM
        join OrderDetail OD on OFM.id = OD.fkOrderId
        where OFM.fkBusinessId = :fkBusinessId
        """)
        List<OrderManagerDTO> findOrderByBuId(Integer fkBusinessId);

    

    // 以下方法未用////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     * 用FK_Guest_Id找資料
     * 
     * @param Id fkGuestId
     * @return List<OrderForm>
     */
    List<OrderForm> findByFkGuestId(Integer fkGuestId);

    /**
     * 請勿使用此方法
     * 只能抓出時間是00:00的資料
     */
    @Query("SELECT total FROM OrderForm WHERE time = :date")
    List<Long> findTotalByTime(@Param("date") Date date);

    /**
     * select ofm.id, ofm.fk_business_id, p.name, od.amount, ofm.time
     * from order_form as ofm
     * join business_user as bu on ofm.fk_business_id = bu.id
     * join order_detail as od on od.fk_order_id = ofm.id
     * join product as p on p.id = od.fk_product_id
     * where bu.id = '1'
     * 此方法尚未應用於前端，有撰寫測試程式
     * 此方法透過外部給予bu.id，回傳bu的訂單id，訂單的product名、數量、以及訂單時間
     * 提取的資料庫欄位是OrderForm下id欄位、fkBu、time；Product下name欄位；orderDetail下amount欄位
     * 要抓出的欄位名稱要與bean內的型別後方名稱一致，不可為資料庫內欄位名稱
     */
    @Query("""
            SELECT new tw.com.gohome.imhangry.domain.dto.OrderFormManagementDTO(
                ofm.id,
                ofm.fkBusinessId,
                p.name,
                od.amount,
                ofm.time)
                FROM OrderForm ofm
                JOIN BusinessUser bu ON bu.id = ofm.fkBusinessId
                JOIN OrderDetail od ON od.fkOrderId = ofm.id
                JOIN Product p ON p.id = od.fkProductId
                WHERE bu.id = :businessId
                """)
    List<OrderFormManagementDTO> findOrderFormsByBusinessId(@Param("businessId") Integer businessId);

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
