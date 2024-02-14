<template>
    <div id="userStatus">
        <h4>歡迎, {{ user.name }}</h4>
    </div>

    <div id="el-carouselFunction">

        <div id="carouselContainer">

            <el-carousel id="carousel" trigger="click" height="400px">
                <el-carousel-item v-for="item in imageList" :key="item">
                    <img :src="item">
                </el-carousel-item>
            </el-carousel>

            <div id="indexFunction">

                <div id="upColumn">

                    <div id="buttonInfo">
                        <button id="customizeIcon">
                            <RouterLink :to="{ name: 'Pay' }">
                                <img src="../../public/homeImage/credit-card.png">
                            </RouterLink>
                        </button>
                        <span style="font-size: 20px; padding: 10px; color: #efefef; ">付款設定</span>
                    </div>

                    <div id="buttonInfo">
                        <button id="customizeIcon">
                            <RouterLink :to="{ name: 'LikesPage' }">
                                <!-- 不要打開，要錢 -->
                                <!-- <img src="../../public/homeImage/likes.png"> -->
                            </RouterLink>
                        </button>
                        <span style="font-size: 20px; padding: 10px; color: #efefef; ">喜愛店家</span>
                    </div>

                    <div id="buttonInfo">
                        <button id="customizeIcon">
                            <RouterLink :to="{ name: 'CartPage' }">
                                <img src="../../public/homeImage/shopping-cart.png">
                            </RouterLink>
                        </button>
                        <span style="font-size: 20px; padding: 10px; color: #efefef; ">購物車
                        </span>
                    </div>

                </div>

                <hr style="color: white;">

                <div id="downColumn">
                    <div id="buttonInfo">

                        <button id="customizeIcon">
                            <RouterLink :to="{ name: 'Orders' }">
                                <img src="../../public/homeImage/order.png">
                            </RouterLink>
                        </button>
                        <span style="font-size: 20px; padding: 10px; color: #efefef; ">訂單</span>
                    </div>

                    <div id="buttonInfo">
                        <button id="customizeIcon">
                            <RouterLink :to="{ name: 'SearchPage' }">
                                <img src="../../public/homeImage/search.png">
                            </RouterLink>
                        </button>
                        <span style="font-size: 20px; padding: 10px; color: #efefef; ">搜尋店家</span>
                    </div>

                    <div id="buttonInfo">
                        <button id="customizeIcon">
                            <img src="../../public/homeImage/user.png">
                        </button>
                        <span style="font-size: 20px; padding: 10px; color: #efefef; ">個人設定</span>
                    </div>

                </div>
            </div>

        </div>

    </div>



    <!-- Start Product Section -->
    <div class="product-section">
        <div class="container">
            <div class="row">

                <!-- Start Column 1 -->
                <div class="col-md-12 col-lg-3 mb-5 mb-lg-0" id="cal1">
                    <h2 class="mb-4 section-title" style="color : white; ">告訴我，今天想來點什麼？</h2>
                    <p class="mb-4">「訂餐不再煩惱，輕鬆點擊，美食隨手可得！」
                        <br>
                        「滿足您的味蕾，輕鬆訂餐，快速送達！」
                    </p>
                    <p><a href="shop.html" class="btn">這裡想做一個按鈕</a></p>
                </div>
                <!-- End Column 1 -->


                <!-- Start Column 2 -->
                <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                    <div id="cal2" class="shape-col">
                        <img src="../../public/homeImage/drink.jpg">
                    </div>
                </div>
                <!-- End Column 2 -->

                <!-- Start Column 3 -->
                <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                    <div id="cal2">
                        <img src="../../public/homeImage/hamburger1.jpg">
                    </div>
                </div>
                <!-- End Column 3 -->

                <!-- Start Column 4 -->
                <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                    <div id="cal2">
                        <img src="../../public/homeImage/roast.jpg">
                    </div>
                </div>
                <!-- End Column 4 -->

            </div>

        </div>
    </div>
    <!-- End Product Section -->

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <!-- v-for="spot in spots" -->
        <!-- 陣列內容是{count:92, list{...}}，上方輸入只會顯示兩筆 ，對應到count、list，因此要加上.list-->
        <!-- <div class="col" v-for="{ spotId, spotImage, spotTitle, spotDescription, address } in spots.list" :key="spotId"> -->

        <div class="col" v-for="(businessInfo, index) in businessInfos" :key="index">
            <div class="card">
                <img src="../../public/homeImage/hamburger1.jpg" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title">{{ businessInfo.name }}</h5>
                    <p class="card-text">{{ businessInfo.describe }}</p>
                    <div class="card-footer">
                        <small class="text-body-secondary">{{businessInfo.address}}</small>
                    </div>
                </div>
            </div>
        </div>


    </div>



    <!-- Start Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="intro-excerpt">
                        <h1>為什麼選擇我們：<span class="d-block">最好的平台</span></h1>
                        <p class="mb-4">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                            vulputate velit imperdiet dolor tempor tristique.</p>
                        <p><a href="" class="btn btn-secondary me-2">Shop Now</a><a href="#"
                                class="btn btn-white-outline">Explore</a></p>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="hero-img-wrap">
                        <img src="../../public/homeImage/hamburger.jpg" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->
</template>



<script setup>
import { onMounted, reactive, ref } from 'vue';
import axios from 'axios';
const businessInfos = reactive({});


const URL = `${import.meta.env.VITE_API_BASE}`


const user = ref({
    name: "",
    id: null,
})

const currentImage = 0;

const imageList = [
    "../../public/homeImage/eating.jpg",
    "../../public/homeImage/orderphone.jpg",
    "../../public/homeImage/crispy.jpg",
    "../../public/homeImage/coffee.jpg",
    // 其他圖片的路徑
]

function logout() {

    sessionStorage.removeItem('userInfo');

    this.$router.push('/BusinessUserLogin');
}

onMounted(async () => {
    if (sessionStorage.getItem('userInfo')) {
        user.value = JSON.parse(sessionStorage.getItem('userInfo'));
    }

    try {
        const response = await axios.get(URL + '/pages/rest/businessUser/findAllBusiness');

        console.log(response.data);
        if (response.data) { // 檢查response.data是否有效
            Object.assign(businessInfos, response.data); // 將API返回的數據賦值給businessInfo
            console.log('businessInfos', businessInfos);
        } else {
            console.error('Error fetching data: Response data is empty');
        }
    } catch (error) {
        console.error('Error fetching data:', error);
    }
});


</script>




<style scoped>

body {
    background-image: linear-gradient(to top, #fcf9fa 79.9%, #435C51 20.1%) !important;
}

#userStatus {
    margin: 10px;
    display: flex;
    justify-content: flex-end;
    /* 將子元素靠左對齊 */
}

#userStatus h4,
#userStatus button {
    color: #DEDED6;
    align-self: flex-end;
    /* 將內容元素靠左對齊 */
}


/*carousel--------------------------------------------*/
.el-carousel {
    border-top-left-radius: 2rem;
    border-bottom-left-radius: 2rem;
}

.el-carousel__item h3 {
    color: #DEDED6;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
    text-align: center;
}

.el-carousel__item:nth-child(2n) {
    background-color: #435C51;
}

.el-carousel__item:nth-child(2n + 1) {
    background-color: #435C51;
}

.el-carousel__item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    /* 按比例縮放，保持圖片完整顯示並填滿容器 */
}

#el-carouselFunction {
    /* background-color: aqua; */
    display: flex;
    flex-direction: column;
    align-content: flex-start;
    /* 將子元素水平排列 */
    justify-content: space-between;
    height: 400px;
    /* 確保父容器有足夠的高度 */
}

/*carousel--------------------------------------------*/


#carouselContainer {
    border-radius: 2rem;
    display: flex;
    width: 100%;
    height: 400px;
    /* 設置一個固定的高度 */
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
}

#carousel {
    width: 70%;
}

#indexFunction {
    border-top-right-radius: 2rem;
    border-bottom-right-radius: 2rem;
    width: 30%;
    height: 400px;

    /* 半透明白色背景 */
    background: rgba(255, 255, 255, 0.1);
    /* 模糊效果 */
    backdrop-filter: blur(30px);
    /* 邊框和其他裝飾性樣式 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding-top: 0.8%;

}

#upColumn {
    padding-top: 10%;
    padding-left: 5%;
    padding-right: 5%;
    display: flex;
    flex-direction: row;
    align-content: flex-start;
    /* 將子元素水平排列 */
    justify-content: space-between;
}

#downColumn {
    padding-top: 10%;
    padding-left: 5%;
    padding-right: 5%;
    display: flex;
    flex-direction: row;
    align-content: flex-start;
    /* 將子元素水平排列 */
    justify-content: space-between;
}

#buttonInfo {
    display: flex;
    flex-direction: column;
    align-content: center;
    /* 將子元素水平排列 */
    justify-content: space-between;
    align-items: center;
}

#customizeIcon {
    padding-block: 0px;
    padding-inline: 0px;
    width: 80px;
    height: 80px;
    border-radius: 50%;
    overflow: hidden;
    /* 隱藏圖片溢出的部分 */
    border: none;
}

#customizeIcon img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: contain;
    /* 確保圖片完全填滿父元素，並保持比例 */
    border: none;
    /* 移除圖片的外部邊框 */
    padding: 15px;
}


.product-section {
    margin-top: 30px;
    margin-bottom: 30px;
    border-radius: 2rem;
    
    /* 半透明白色背景 */
    background: rgba(255, 255, 255, 0.1);
    /* 模糊效果 */
    backdrop-filter: blur(30px);
    /* 邊框和其他裝飾性樣式 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.product-section .container {
    /* background-color: #fff; */
    padding: 20px;
}

.demonstration {
    color: var(--el-text-color-secondary);
}



.row {
    /* background-color: #96db16; */
    display: flex;
    /* padding-left: 1.5%; */
}


#cal1 {
    border-radius: 1.5rem;
    /* background-color: #b5afc3; */
    /* margin-right: 1.5%; */

}

#cal2 img {
    background-color: #16db85;
    border-radius: 1.5rem;
    width: 100%;
    height: 100%;

}

.hero {
    padding: 10px;

}
</style>