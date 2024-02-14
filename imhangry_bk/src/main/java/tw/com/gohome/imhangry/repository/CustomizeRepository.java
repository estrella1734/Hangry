package tw.com.gohome.imhangry.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.gohome.imhangry.domain.Customize;
import tw.com.gohome.imhangry.repository.declaredinterfaces.CustomizeRepositoryCustom;
import java.util.List;


public interface CustomizeRepository extends JpaRepository<Customize, Integer>, CustomizeRepositoryCustom {


    List<Customize> findByFkCategoryId(Integer fkCategoryId);
}
