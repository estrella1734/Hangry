package tw.com.gohome.imhangry.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.gohome.imhangry.domain.CustomizeOption;
import tw.com.gohome.imhangry.repository.declaredinterfaces.CustomizeOptionRepositoryCustom;
import java.util.List;


public interface CustomizeOptionRepository
                extends JpaRepository<CustomizeOption, Integer>, CustomizeOptionRepositoryCustom {

    
    List<CustomizeOption> findByFkCustomizeId(Integer fkCustomizeId);
}
