<template>
    <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">
        <div class="container">

            

            <RouterLink :to="{ name: 'Home' }" class="navbar-brand" active-class="nav-link-active">Hangry<span>, Time to
                    Walk the Food Walk</span></RouterLink>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
                aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">

                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsFurni">
                <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">

                    <li>
                        <RouterLink :to="{ name: 'Register' }" class="nav-link" active-class="nav-link-active"
                            v-show="!(guLogin || buLogin)">會員註冊
                        </RouterLink>
                    </li>

                    <li>
                        <RouterLink :to="{ name: 'LoginPage' }" class="nav-link" active-class="nav-link-active"
                            v-show="!(guLogin && buLogin)">登入
                        </RouterLink>
                    </li>

                    <li>
                        <RouterLink :to="{ name: 'SearchPage' }" class="nav-link" active-class="nav-link-active">搜尋店家
                        </RouterLink>
                    </li>

                    <li>
                        <RouterLink :to="{ name: 'OrderPage' }" class="nav-link" active-class="nav-link-active">點餐
                        </RouterLink>
                    </li>

                    <li class="nav-item dropdown" v-show="guLogin">

                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                            aria-expanded="false">個人設定</a>

                        <ul class="dropdown-menu">

                            <li>
                                <!-- TODO增加一些icon在選項後方 -->
                                <RouterLink :to="{ name: 'InfoUpdate' }" class="nav-link" active-class="nav-link-active">
                                    會員資料修改
                                </RouterLink>
                            </li>

                            <li>
                                <RouterLink :to="{ name: 'GuCoupon' }" class="nav-link" active-class="nav-link-active">
                                    專屬優惠券
                                </RouterLink>
                            </li>

                            <li>
                                <RouterLink :to="{ name: 'Pay' }" class="nav-link" active-class="nav-link-active">
                                    付款</RouterLink>
                            </li>

                            <li>
                                <RouterLink :to="{ name: 'Orders' }" class="nav-link" active-class="nav-link-active">
                                    訂單
                                </RouterLink>
                            </li>

                        </ul>
                    </li>


                    <li class="nav-item dropdown" v-show="buLogin">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                            aria-expanded="false">商家功能</a>
                        <ul class="dropdown-menu">

                            <li>
                                <RouterLink :to="{ name: 'DynamicBarChart' }" class="nav-link"
                                    active-class="nav-link-active">
                                    今日概況
                                </RouterLink>
                            </li>

                            <li>
                                <RouterLink :to="{ name: 'OrderManager' }" class="nav-link" active-class="nav-link-active">
                                    訂單檢視
                                </RouterLink>
                            </li>

                            <li>
                                <RouterLink :to="{ name: 'PlatformCoupon' }" class="nav-link"
                                    active-class="nav-link-active">
                                    優惠券列表
                                </RouterLink>
                            </li>

                            <li>
                                <RouterLink :to="{ name: 'BuMenu' }" class="nav-link" active-class="nav-link-active">
                                    商品列表
                                </RouterLink>
                            </li>

                        </ul>
                    </li>


                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                            aria-expanded="false" v-show="guLogin || buLogin">登出</a>

                        <ul class="dropdown-menu">

                            <li class="nav-link" active-class="nav-link-active" v-show="guLogin">
                                <a href="#" @click="doLogout" class="nav-link" active-class="nav-link-active">使用者登出</a>
                            </li>

                            <li class="nav-link" active-class="nav-link-active" v-show="buLogin">
                                <a href="#" @click="buLogout" class="nav-link" active-class="nav-link-active">商家登出</a>
                            </li>

                        </ul>

                    </li>


                </ul>

            </div>
        </div>


    </nav>
</template>
    
<script setup>
import { getCookieData } from '@/components/sean/util/Gettes';
import router from '@/router/router';
import Cookies from 'js-cookie';
import Swal from 'sweetalert2';
import { ref, } from 'vue';
const cookieData = ref()
const buLogin = ref(false)

//bu登入、登出//////////////////////////////////////////////////////////////////////////////
//session是確認商家是否有登入
let userInfo = sessionStorage.getItem('userInfo')
if (userInfo != null) {
    buLogin.value = !buLogin.value;
}

//bu登出
function buLogout() {
    sessionStorage.removeItem('userInfo');
    router.push('/BusinessUserLogin').then(() => {
        window.location.reload();
    });
}
/////////////////////////////////////////////////////////////////////////////////////////



//gu登入、登出//////////////////////////////////////////////////////////////////////////////
//cookie是確認商家是否有登入
const userData = ref(getCookieData('userData'));
//userData有值返回2，等於true
const guLogin = ref(!!userData.value && userData.value.id);

//gu登出
const doLogout = () => {
    Swal.fire({
        title: '確定登出嗎?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消',
    }).then((result) => {
        if (result.isConfirmed) {
            // 刪除 userData 的 Cookie
            Cookies.remove('userData');
            //guLogin的值為false代表沒登入
            guLogin.value = false;
            //回登入視窗並重整渲染NavBar
            router.push({ name: 'LoginPage' }).then(() => {
                window.location.reload();
            });
        }
    });
};
/////////////////////////////////////////////////////////////////////////////////////////


</script>
    
<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap");

body {
    overflow-x: hidden;
    position: relative;
    font-family: "Inter", sans-serif;
    font-weight: 400;
    line-height: 28px;
    color: #6a6a6a;
    font-size: 14px;
    background-color: #eff2f1;
}

.custom-navbar {
    padding-top: 20px;
    padding-bottom: 20px;
    /* 半透明白色背景 */
    background: rgba(255, 255, 255, 0.1) !important;
    /* 模糊效果 */
    backdrop-filter: blur(30px);
    /* 邊框和其他裝飾性樣式 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding-top: 0.8%;
}

.custom-navbar .navbar-brand {
    font-size: 32px;
    font-weight: 600;
}

.custom-navbar .navbar-brand>span {
    font-size: 18px;
    opacity: .4;
}

@media (min-width: 992px) {
    .custom-navbar .custom-navbar-nav li {
        margin-left: 15px;
        margin-right: 15px;
    }
}

.custom-navbar .custom-navbar-nav li a {
    font-weight: 500;
    color: #ffffff;
    opacity: .5;
    -webkit-transition: .3s all ease;
    -o-transition: .3s all ease;
    transition: .3s all ease;
    position: relative;
}

@media (min-width: 768px) {
    .custom-navbar .custom-navbar-nav li a:before {
        content: "";
        position: absolute;
        bottom: 0;
        left: 8px;
        right: 8px;
        background: #f9bf29;
        height: 5px;
        opacity: 1;
        visibility: visible;
        width: 0;
        -webkit-transition: .15s all ease-out;
        -o-transition: .15s all ease-out;
        transition: .15s all ease-out;
    }
}

.custom-navbar .custom-navbar-nav li a:hover {
    opacity: 1;
}

.custom-navbar .custom-navbar-nav li a:hover:before {
    width: calc(100% - 16px);
}

.dropdown-menu {
    background-color: #6a6a6a;
}
</style>