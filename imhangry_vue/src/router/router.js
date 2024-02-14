import { createRouter, createWebHistory } from 'vue-router'

//import全域component
import Home from "../views/Home.vue"
import NotFound from "../views/NotFound.vue"


//bird component
import CartPage from '@/views/bird/CartPage.vue'
import OrderPage from '@/views/bird/OrderPage.vue'

//gkd component
import DynamicBarChart from '../components/gkd/DynamicBarChart.vue'
import OrderManager from '../components/gkd/OrderManager.vue'

//leon component
import LikesPage from '@/views/leon/LikesPage.vue'
import NearbySearchPage from '@/views/leon/NearbySearchPage.vue'
import OrderDetail from '@/views/leon/OrderDetail.vue'
import Orders from '@/views/leon/Orders.vue'
import SearchPage from '@/views/leon/SearchPage.vue'

//sean component
import InfoUpdate from '@/components/sean/InfoUpdate.vue'
import LoginHome from '@/components/sean/LoginHome.vue'
import Register from '../components/sean/Register.vue'
import UserLogin from '../components/sean/UserLogin.vue'

//ys component
import BuMenu from '../views/ys/BuMenu.vue'
import GuCoupon from '../views/ys/GuCoupon.vue'
import GuCouponList from '../views/ys/GuCouponList.vue'
import MenuUpdate from '../views/ys/MenuUpdate.vue'
import MenuUpload from '../views/ys/MenuUpload.vue'
import MenuUploadFile from '../views/ys/MenuUploadFile.vue'
import PlatformCoupon from '../views/ys/PlatformCoupon.vue'
import PlatformCouponUpload from '../views/ys/PlatformCouponUpload.vue'
import PlatformCouponUploadFile from '../views/ys/PlatformCouponUploadFile.vue'

//yty component
import Bregister from '@/views/yty/Bregister.vue'
import LoginPage from '../views/LoginPage.vue'
import BusinessUserLogin from '../views/yty/BusinessUserLogin.vue'
import Pay from '../views/yty/Pay.vue'



const routes = [
    //global
    { name: "Home", path: '/', component: Home },
    { name: "404", path: '/:pathMatch(.*)*', component: NotFound },

    //gkd
    { name: "DynamicBarChart", path: '/DynamicBarChart', component: DynamicBarChart },//BU登入後bar有按鈕
    { name: "OrderManager", path: '/OrderManager', component: OrderManager },//BU登入後bar有按鈕


    //yty
    { name: "BusinessUserLogin", path: '/BusinessUserLogin', component: BusinessUserLogin },
    { name: "LoginHome", path: '/LoginHome/:id', component: LoginHome },
    { name: "LoginPage", path: '/LoginPage', component: LoginPage },//bar有按鈕
    { name: "Bregister", path: '/Bregister', component: Bregister },

    //sean
    { name: "UserLogin", path: '/UserLogin', component: UserLogin },//未登入前bar有按鈕
    { name: "Register", path: '/Register', component: Register },//bar有按鈕
    { name: "InfoUpdate", path: '/InfoUpdate', component: InfoUpdate },//gu登入後bar有按鈕

    //bird
    { name: "OrderPage", path: '/OrderPage/:id?', component: OrderPage },//首頁有按鈕
    { name: "OrderDetail", path: '/OrderDetail/:orderId', component: OrderDetail },
    { name: "CartPage", path: '/CartPage', component: CartPage },//首頁有按鈕
    { name: "Pay", path: '/Pay/:id?', component: Pay },//首頁有按鈕

    //leon
    { name: "Orders", path: '/Orders', component: Orders },//首頁有按鈕
    { name: "LikesPage", path: '/LikesPage', component: LikesPage },//首頁有按鈕
    { name: "SearchPage", path: '/SearchPage', component: SearchPage },//首頁、bar有按鈕
    { name: "NearbySearchPage", path: '/NearbySearchPage', component: NearbySearchPage },

    //ys bu登入後bar有按鈕
    { name: "MenuUpload", path: '/MenuUpload', component: MenuUpload },
    { name: "MenuUploadFile", path: '/MenuUploadFile', component: MenuUploadFile },
    { name: "MenuUpdate", path: '/MenuUpdate/:id?', component: MenuUpdate },
    { name: "PlatformCoupon", path: '/PlatformCoupon', component: PlatformCoupon },
    { name: "PlatformCouponUpload", path: '/PlatformCouponUpload', component: PlatformCouponUpload },
    { name: "PlatformCouponUploadFile", path: '/PlatformCouponUploadFile', component: PlatformCouponUploadFile },
    { name: "GuCoupon", path: '/GuCoupon', component: GuCoupon },
    { name: "GuCouponList", path: '/GuCouponList', component: GuCouponList },
    { name: "BuMenu", path: '/BuMenu', component: BuMenu }

]

const router = createRouter({
    history: createWebHistory(),
    routes,
})

export default router


