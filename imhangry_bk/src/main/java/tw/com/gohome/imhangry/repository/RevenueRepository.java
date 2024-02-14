package tw.com.gohome.imhangry.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.gohome.imhangry.domain.Revenue;
import tw.com.gohome.imhangry.repository.declaredinterfaces.RevenueRepositoryCustom;

public interface RevenueRepository extends JpaRepository<Revenue, Integer>, RevenueRepositoryCustom{
    
}
