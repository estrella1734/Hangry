package tw.com.gohome.imhangry.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.gohome.imhangry.domain.Category;
import tw.com.gohome.imhangry.repository.declaredinterfaces.CategoryRepositoryCustom;


public interface CategoryRepository extends JpaRepository<Category,Integer>,CategoryRepositoryCustom {

    
    
}
