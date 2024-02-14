package tw.com.gohome.imhangry.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Temporal;
import org.springframework.data.repository.query.Param;

import jakarta.persistence.TemporalType;
import tw.com.gohome.imhangry.domain.Product;
import tw.com.gohome.imhangry.domain.dto.ProductCategoryDTO;
import tw.com.gohome.imhangry.domain.dto.ProductQuickViewDTO;
import tw.com.gohome.imhangry.domain.dto.ProductReportDTO;
import tw.com.gohome.imhangry.repository.declaredinterfaces.ProductRepositoryCustom;

public interface ProductRepository extends JpaRepository<Product, Integer>, ProductRepositoryCustom {
    Product findByName(String name);

    /**
     * 用店家ID找Product
     * 
     * @param fkBusinessId 店家ID
     * @return
     */
    List<Product> findByFkBusinessId(Integer fkBusinessId);

    /**
     * 透過分類找Product
     * 
     * @param fkCategoryId 分類id
     * @return
     */
    List<Product> findByFkCategoryId(Integer fkCategoryId);

    List<Product> findByFkCategoryIdAndFkBusinessId(Integer fkCategoryId, Integer fkBusinessId);

    @Query("""
                SELECT distinct new tw.com.gohome.imhangry.domain.dto.ProductCategoryDTO(p.fkCategoryId categoryId,c.categoryName categoryName)
                FROM Product p join Category c on p.fkCategoryId=c.id
                where fkBusinessId = :id
                order by categoryId
            """)
    List<ProductCategoryDTO> getCategoryByBusinessId(Integer id);

    // gkd/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     * select * from product
     * join order_detail on product.id = order_detail.fk_product_id
     * where fk_business_id = '1'
     * 此方法尚未應用於前端，測試程式也尚未撰寫
     * 此方法透過外部給予當日日期區間，可以回傳查看規範區間的訂單付款狀況
     * 提取的資料庫欄位是OrderForm下payment_status欄位
     * 要抓出的欄位名稱要與bean內的型別後方名稱一致，不可為資料庫內名稱
     */
    @Query(value = "SELECT p FROM Product p JOIN p.orderDetails od WHERE p.fkBusinessId = '1'", nativeQuery = true)
    List<Product> findOrderByFKBusiness();

    /**
     * SELECT
     * p.id, p.name, p.fk_category_id, p.price, od.amount, ofm.time
     * FROM product p
     * FULL JOIN
     * order_detail od ON p.id = od.fk_product_id
     * FULL JOIN
     * order_form ofm ON od.fk_order_id = ofm.id
     * WHERE
     * p.fk_business_id = 1
     * AND ofm.[time] >= '2024-01-01' AND ofm.[time] <= '2024-02-28'
     * 此方法應用於前端「」，測試程式「」
     * 此方法透過外部給予BuId與選擇日期區間，可以回傳查看規範區間的產品資訊
     * 要抓出的欄位名稱要與bean內的型別後方名稱一致，不可為資料庫內名稱
     */
    @Query("""
            SELECT new tw.com.gohome.imhangry.domain.dto.ProductReportDTO(
                p.id,
                p.name,
                p.fkCategoryId,
                p.price,
                od.amount,
                ofm.time)
            FROM Product p
            JOIN OrderDetail od ON p.id = od.fkProductId
            JOIN OrderForm ofm ON od.fkOrderId = ofm.id
            WHERE
            p.fkBusinessId = :fkBusinessId AND ofm.time >= :startDate AND ofm.time <= :endDate
                    """)
    List<ProductReportDTO> findReportByFkBusinessIdAndDate(
            @Param("fkBusinessId") Integer fkBusinessId,
            @Param("startDate") @Temporal(TemporalType.DATE) Date startDate,
            @Param("endDate") @Temporal(TemporalType.DATE) Date endDate);

    /**
     * SELECT
     * p.id AS ProductID,
     * p.name AS ProductName,
     * SUM(od.amount) AS TotalSales,
     * p.fkCategoryId AS CategoryId,
     * p.price AS Price
     * FROM
     * Product p
     * JOIN
     * orderDetail od ON p.id = od.fkProductId
     * JOIN
     * OrderForm ofm ON od.fkOrderId = ofm.id
     * WHERE
     * p.fkBusinessId = :fkBusinessId and ofm.time >= '2024-01-01' AND :startDate
     * AND ofm.time <= :endDate
     * GROUP BY
     * p.id, p.name,p.fkCategoryId, p.price
     * AND ofm.[time] >= '2024-01-01' AND ofm.[time] <= '2024-02-28'
     * 此方法應用於前端「」，測試程式「」
     * 此方法透過外部給予BuId與選擇日期區間，可以回傳查看規範區間的產品資訊
     * 要抓出的欄位名稱要與bean內的型別後方名稱一致，不可為資料庫內名稱
     */
    @Query("""
            SELECT new tw.com.gohome.imhangry.domain.dto.ProductQuickViewDTO(
            p.id,
            p.name,
            SUM(od.amount),
            p.fkCategoryId,
            p.price
            )
            FROM Product p
            JOIN OrderDetail od ON p.id = od.fkProductId
            JOIN OrderForm ofm ON od.fkOrderId = ofm.id
            WHERE
            p.fkBusinessId = :fkBusinessId AND ofm.time >= :startDate AND ofm.time <= :endDate
            GROUP BY
            p.id, p.name,p.fkCategoryId, p.price""")
    List<ProductQuickViewDTO> findProductQVByFkBusinessIdAndDate(
            @Param("fkBusinessId") Integer fkBusinessId,
            @Param("startDate") @Temporal(TemporalType.DATE) Date startDate,
            @Param("endDate") @Temporal(TemporalType.DATE) Date endDate);
}
