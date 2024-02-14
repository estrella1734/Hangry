package tw.com.gohome.imhangry.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.gohome.imhangry.domain.PaymentMethod;
import tw.com.gohome.imhangry.repository.declaredinterfaces.PaymentMethodRepositoryCustom;


public interface PaymentMethodRepository extends JpaRepository<PaymentMethod,Integer> ,PaymentMethodRepositoryCustom{

    //第三步
    //宣告介面繼承 JpaRepository<Bean,Id> , 自定義的介面
    //其中 Bean為 要操作的table的java類別
    //Id為 此table的主鍵的資料型態

    //之後用此介面實例操作資料庫

    
}
