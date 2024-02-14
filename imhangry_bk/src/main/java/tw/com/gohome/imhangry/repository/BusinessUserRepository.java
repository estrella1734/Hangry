package tw.com.gohome.imhangry.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.gohome.imhangry.domain.BusinessUser;
import tw.com.gohome.imhangry.domain.dto.BrandResultDTO;
import tw.com.gohome.imhangry.domain.dto.BusinessUserOrderPageDTO;
import tw.com.gohome.imhangry.domain.dto.HomeBuInfoDTO;
import tw.com.gohome.imhangry.repository.declaredinterfaces.BusinessUserRepositoryCustom;

public interface BusinessUserRepository extends JpaRepository<BusinessUser, Integer>, BusinessUserRepositoryCustom {

    @Query("""
            select new tw.com.gohome.imhangry.domain.dto.BrandResultDTO(
                bu.id id,bu.name name,bu.operationTime operationTime,bu.rate rate,bu.address
                address,bu.imageIcon imageIcon,bu.dist dist,bu.city city)
                From BusinessUser bu
                join Brand bd on bd.id = bu.fkBrandId
                where bd.name = :brand
                """)
    public List<BrandResultDTO> findByBrand(String brand);

    @Query("FROM BusinessUser WHERE businessType = :type")
    List<BusinessUser> findByType(String type);

    @Query("FROM BusinessUser WHERE dist = :dist")
    List<BusinessUser> findByDist(String dist);

    @Query("SELECT businessType FROM BusinessUser GROUP BY businessType")
    List findAllType();

    BusinessUser findByName(String name);

    BusinessUser findByNameAndPassword(String name, String password);

    Optional<BusinessUser> findById(Integer id);

    @Query("""
            select new tw.com.gohome.imhangry.domain.dto.BusinessUserOrderPageDTO(bu.id id,bu.name name,b.name brandName,bu.operationTime time,bu.phone phone,bu.city city,bu.dist dist,bu.address address,bu.rate rate)
            from BusinessUser bu
            join Brand b on bu.fkBrandId = b.id
            where bu.id = :businessUserId
            """)
    public BusinessUserOrderPageDTO findUser(Integer businessUserId);

    // gkd///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /**
     * 1.
     * 此方法應用於前端今日店務->修改店家資訊
     * 完成後再回傳一個修改完成的BusinessUser bean
     * 
     * @param BusinessUser
     * @return BusinessUser
     */
    BusinessUser save(BusinessUser user);

    /**
     * 2.
     * 此方法應用於前端首頁->所有店家資訊(已無使用)
     * 
     * @param none
     * @return List<BusinessUser>
     */
    List<BusinessUser> findAll();

    /**
     * 3.
     * 此方法應用於前端首頁->所有店家資訊
     * 
     * @param none
     * @return List<HomeBuInfoDTO>
     */
    @Query("""
            select new tw.com.gohome.imhangry.domain.dto.HomeBuInfoDTO(name, rate, address, describe, imageIcon, imageIndex, operationTime, phone)
            from BusinessUser
            """)
    List<HomeBuInfoDTO> findAllDTO();

    // gkd///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
