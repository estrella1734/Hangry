package tw.com.gohome.imhangry.controller.bird;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.com.gohome.imhangry.domain.GuestAddress;
import tw.com.gohome.imhangry.domain.OrderDetail;
import tw.com.gohome.imhangry.domain.OrderForm;
import tw.com.gohome.imhangry.domain.dto.BusinessUserOrderPageDTO;
import tw.com.gohome.imhangry.domain.dto.CouponsDTO;
import tw.com.gohome.imhangry.domain.dto.formDetailDTO;
import tw.com.gohome.imhangry.service.bird.AddressService1;
import tw.com.gohome.imhangry.service.bird.BusinessUserService1;
import tw.com.gohome.imhangry.service.bird.CouponService1;
import tw.com.gohome.imhangry.service.bird.CustomizeService1;
import tw.com.gohome.imhangry.service.bird.OrderDetailService1;
import tw.com.gohome.imhangry.service.bird.OrderFormService1;
import tw.com.gohome.imhangry.service.bird.ProductService1;


@CrossOrigin
@RestController
@RequestMapping("orderPage")
public class OrderPageController {
    @Autowired
    private BusinessUserService1 businessUserService1;

    @Autowired
    private ProductService1 productService1;

    @Autowired
    private CustomizeService1 customizeService1;

    @Autowired
    private AddressService1 addressService1;

    @Autowired
    private OrderFormService1 orderFormService1;

    @Autowired
    private OrderDetailService1 orderDetailService1;

    @Autowired
    private CouponService1 couponService1;

    @DeleteMapping("coupon/{id}")
    public Boolean deleteCoupon(@PathVariable Integer id){
        if(id != null){
            couponService1.deleteByCouponId(id);
            return true;

        }
        return false;
    }


    @GetMapping("coupon/{id}")
    public List<CouponsDTO> getCoupons(@PathVariable Integer id) {
    
        
        return id == null? null : couponService1.searchCoupons(id);
    }
    

    @PostMapping("cart/detail/{id}")
    public List<OrderDetail> InsertOrderDetails(@RequestBody List<formDetailDTO> entity,@PathVariable Integer id) {
        if(id == null || entity ==null || entity.isEmpty()){
            return null;
        }
        List<OrderDetail> list = new ArrayList<>();
        entity.forEach(item->{
            list.add(new OrderDetail(null,
                        item.getAmount(),
                        item.getProductName(),
                        item.getProductPrice()+item.getExtraPrice(),
                        item.getImage(),
                        Arrays.toString(item.getCustomizes()),
                        item.getCategory(),
                        item.getTotalPrice(),
                        id,
                        item.getProductId()
                        ));
        });
        List<OrderDetail> responseList = orderDetailService1.insertDetail(list);

        return responseList;
    }

    @PostMapping("cart")
    public OrderForm postMethodName(@RequestBody OrderForm orderForm) {

        return orderForm == null ? null : orderFormService1.insertOrder(orderForm);
    }

    @GetMapping("cart/{id}")
    public List<GuestAddress> getAddress(@PathVariable Integer id) {
        return id == null ? null : addressService1.searchAddress(id);
    }

    @GetMapping("/{id}")
    public BusinessUserOrderPageDTO getInfo(@PathVariable Integer id) {

        if (id != null) {
            return businessUserService1.getBusinessUserInfo(id);
        }

        return null;
    }

    @GetMapping("/products/{businessUserId}")
    public List<Map<String, Object>> getProducts(@PathVariable Integer businessUserId) {
        if (businessUserId != null) {
            return productService1.searchCategories(businessUserId);
        }

        return null;
    }

    @GetMapping("/customizations/{categoryId}")
    public List<Map<String, Object>> getCustomizations(@PathVariable Integer categoryId) {
        if (categoryId != null) {
            return customizeService1.searchCustomizes(categoryId);
        }
        return null;
    }
}
