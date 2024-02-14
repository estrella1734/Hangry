<template>
    <div id="app">
        <NavBar class="navBar"></NavBar>
        <br>
        <br>
        <br>
        <br>
        <!-- 背景圖片容器 -->
        <div class="parallax-container">
            <div class="parallax"></div>
        </div>

        <router-view />
        <Footer></Footer>
    </div>
</template>

<script setup>
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import { onMounted, onUnmounted } from 'vue';
import NavBar from './views/NavBar.vue';
import Footer from './views/Footer.vue'

//背景與滾動
const handleScroll = () => {
    const scrollTop = window.pageYOffset;
    const parallax = document.querySelector('.parallax');
    parallax.style.transform = `translate3d(${scrollTop * 0.5}px, -${scrollTop * 0.5}px, 0)`; // 調整 0.5 以改變速度
}

onMounted(() => {
    window.addEventListener('scroll', handleScroll);
});

onUnmounted(() => {
    window.removeEventListener('scroll', handleScroll);
});

</script>

<style>
body {
    background-color: #435C51;
}

.navbar {
    position: fixed;
    /* 將 Navbar 固定在頁面上方 */
    top: 0;
    /* 距離頁面上方的距離，可以根據需要調整 */
    left: 0;
    /* 如果需要，也可以設置 left 屬性 */
    width: 100%;
    /* 讓 Navbar 佔滿整個頁面的寬度 */
    z-index: 1000;
    /* 設置 z-index 以確保 Navbar 在其他元素之上 */
    /* 其他樣式設定 */
}

/* 背景圖片樣式 */
.parallax-container {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
}

.parallax {
    background-image: url('public/homeImage/background.png');
    background-size: auto 100%;
    width: 100vw;
    height: 150vh;
    transform: translate3d(0, 0, 0);
}




/*以下為今日概況的修改Bu Info內部SweetAlert的css，逼不得已寫在這*/
/*//////////////////////////////////////////////////////// */
.gkdPopup {

    border-radius: 2rem;
    width: 70%;
    /* height: 100%; */
    display: flex;
    /* 水平置中內部div */
    justify-content: center;
    /* 垂直置中內部div */
    align-content: center;
    flex-wrap: wrap;

    /* 半透明白色背景 */
    background: rgba(255, 255, 255, 0.1);
    /* 模糊效果 */
    backdrop-filter: blur(30px);
    /* 邊框和其他裝飾性樣式 */
    border: 1px solid rgba(255, 255, 255, 0.3);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding-top: 0.8%;
}

.buInfoBody {
    /* 這裡是您選擇的背景顏色 */
    background-color: #efefef;
    border-radius: 1.2rem;
    display: flex;
    /* 水平置中內部div */
    justify-content: center;
    /* 垂直置中內部div */
    align-content: center;
    flex-wrap: wrap;
    padding-left: 10%;
    padding-bottom: 2%;
    padding-right: 2%;

}

.buInfoCardBody {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    /* 這將使子元素預設靠左對齊 */
}

.buInfoHeader {
    margin: 20px;
    width: 100%;
    height: 100%;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    /* 水平居中 */
    align-items: center;
    /* 垂直居中 */

}

.leftRightContainer {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

.buInfoLeftCard {
    /*自身的排列 */
    float: left;
    width: 50%;
    padding: 20px;

    /*子元素的排列 */
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    /* 在主軸上分散對齊子項目 */
}

.bILCC {
    display: flex;
    flex-direction: column;
    /* 讓子元素垂直排列 */
}

.inputRow {
    display: flex;
    align-items: center;
}

.datePick {
    flex-direction: column;
    /* 上下排列 */
}

.inputContainer {
    margin: 10px;
    /* 設定間距 */
}

.inputRowDate {
    display: flex;
    align-items: center;
    justify-content: space-between;
    align-items: center;
}

.pbuInfo {
    font-size: 20px;
}

.buInfoLeftCard span {
    width: 100px;
    /* 設置一個固定的寬度 */
    margin-right: 10px;
    /* 標籤和輸入框之間的間距 */
    text-align: right;
    /* 讓標籤的文字靠右對齊 */
}

.bILCCLeft {
    float: left;
    width: 50%;
    /* align-items: center; */
    /* min-width: 100px; */
    /* 設置最小寬度 */
    /* margin-right: 10px; */
    /* 設置間距 */

}

.bILCCRight {
    float: right;
    width: 50%;
}

.swal2-input,
.swal2-textarea {
    /* background-color: #efefef; */
    margin: 10px;

}

.buInfoRightCard {
    border-top-left-radius: 60%;
    border-bottom-right-radius: 1.2rem;
    background-color: #F9BF29;
    float: right;
    width: 50%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.buInfoIcon img {
    background-color: #33808B;
    width: 200px;
    height: 200px;
    border-radius: 50%;
}

.custom-confirm-button {
    font-size: 20px !important;
    padding: 10px 25px !important;
    color: white !important;
    background-color: #33808B !important;
}

.custom-cancel-button {
    font-size: 20px !important;
    padding: 10px 20px !important;
    color: white !important;
    background-color: #33808B !important;
}

/*//////////////////////////////////////////////////////// */
</style>
