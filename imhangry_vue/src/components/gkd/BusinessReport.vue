<template>
    <div class="body">
        <div class="card">
            <div class="cardBody">

                <div class="calHeader">

                    <div class="calHeaderStart">
                        <span style="font-size: 20px; padding: 10px 20px;">{{ startDate }}
                        </span>
                    </div>

                    <font-awesome-icon :icon="['fas', 'arrow-right-long']" />

                    <div class="calHeaderEnd">
                        <span style="font-size: 20px; padding: 10px 20px;">{{ endDate }}</span>
                    </div>
                    <!-- 拿到目前選定的日期字串解析 -->
                    <!-- <p>{{ dateInfo.startDate }}</p>
                <p>{{ dateInfo.endDate }}</p> -->

                    <font-awesome-icon :icon="['far', 'calendar-days']" />





                </div>
                <div class="switchDownloadContainer">
                    <div class="switchLeftCard">

                        <div class="switchContainer">

                            <div class="form-check form-switch">
                                <input class="form-check-input custom-switch" type="checkbox" v-model="switch1"
                                    id="switch1">
                                <label class="form-check-label" for="switch1"> 商品#ID
                                </label>
                            </div>

                            <br>

                            <div class="form-check form-switch">
                                <input class="form-check-input custom-switch" type="checkbox" v-model="switch2"
                                    id="switch2">
                                <label class="form-check-label" for="switch2"> 商品分類
                                </label>
                            </div>

                            <br>

                            <div class="form-check form-switch">

                                <input class="form-check-input custom-switch" type="checkbox" v-model="switch3"
                                    id="switch3">
                                <label class="form-check-label" for="switch3"> 商品單價
                                </label>
                            </div>

                            <br>

                            <div class="form-check form-switch">

                                <input class="form-check-input custom-switch" type="checkbox" v-model="switch4"
                                    id="switch3">
                                <label class="form-check-label" for="switch4"> 訂單時間
                                </label>
                            </div>
                        </div>

                    </div>

                    <div class="downloadRightCard">
                        <!-- <span style="font-size: 20px; padding: 10px 20px;">
                            選擇想要的資訊，
                        </span>
                        <span style="font-size: 20px; padding: 10px 20px;">
                            點擊按鈕下載報表
                        </span> -->
                        <button class="btn btn-warning btn-lg" @click="downloadReportData"
                            style="font-size: 20px; padding: 10px 20px; color: white; background-color: #33808B;">
                            營業報表 <font-awesome-icon :icon="['fas', 'file-export']" />
                        </button>
                        <br>
                        <button class="btn btn-warning btn-lg" @click="downloadOrderData"
                            style="font-size: 20px; padding: 10px 20px; color: white; background-color: #33808B;"
                            :disabled="!switch4">
                            歷史訂單 <font-awesome-icon :icon="['far', 'rectangle-list']" />
                        </button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</template>
    
<script setup>
defineProps(['names'])
import { useDateInfo } from '@/stores/dateInfo'; //pinia
import { Parser } from '@json2csv/plainjs';
import axios from 'axios';
import { computed, onMounted, ref, watch, watchEffect } from 'vue';


//日期轉格式
const formatDate = (date) => {
    let day = date.getDate().toString();
    let month = (date.getMonth() + 1).toString(); // 加 1 因為月份是從 0 開始
    const year = date.getFullYear().toString();

    // 確保月和日都是兩位數
    day = day.length < 2 ? '0' + day : day;
    month = month.length < 2 ? '0' + month : month;

    return `${year}-${month}-${day}`;
};

//field
//拿出使用者資料
const userString = sessionStorage.getItem('userInfo');
const user = JSON.parse(userString);
const buId = user.id;
//pinia內的日期資訊
const dateInfo = useDateInfo();
const startDate = ref(formatDate(dateInfo.startDate));
const endDate = ref(formatDate(dateInfo.endDate));
const range = computed(() => startDate.value + endDate.value);
// 定義用於儲存報表資料的 ref
const reportData = ref([]);
// 定義用於儲存訂單資料的 ref
const orderData = ref([]);
//按鈕開關
const switch1 = ref(true)
const switch2 = ref(true)
const switch3 = ref(true)
const switch4 = ref(false)


//呼叫API，動態拿取時間切換下呼叫API的資料，並將資料賦值給參數
const fetchData = async () => {
    const requestBody = {
        buId: buId,
        startDate: startDate.value,
        endDate: endDate.value,
    }
    const reportResponse = await axios.post(`${import.meta.env.VITE_API_BASE}/pages/rest/product/productQuickView`, requestBody)
    const orderResponse = await axios.post(`${import.meta.env.VITE_API_BASE}/pages/rest/product/findProductByBuIdAndDate`, requestBody)

    reportData.value = reportResponse.data;
    orderData.value = orderResponse.data;
}

//下載報表
const downloadReportData = async () => {
    const requestBody = {
        buId: buId,
        startDate: startDate.value,
        endDate: endDate.value,
    }
    const reportResponse = await axios.post(`${import.meta.env.VITE_API_BASE}/pages/rest/product/productQuickView`, requestBody)

    reportData.value = reportResponse.data;

    //將proxy物件放入普通物件
    const dataArray = Object.values(reportData.value);

    //把開關的條件放入陣列
    const optionArray = [];
    if (!switch1.value) optionArray.push('productId')
    if (!switch2.value) optionArray.push('categoryId')
    if (!switch3.value) optionArray.push('price')
    // console.log(optionArray);

    //dataArray.map(item => {...}): 
    //對 dataArray 陣列中的每個元素（代表一個物件）執行一個函數。
    //這個函數會返回一個新的物件，這個新物件是原始物件經過過濾後的結果。
    const optionsArray = dataArray.map(item => {

        // 創建一個新的空物件，用於存儲過濾後的鍵值對
        const newItem = {};

        // 遍歷當前item的每個鍵
        for (const key in item) {

            // 檢查當前鍵是否不在 optionArray 中
            if (!optionArray.includes(key)) {
                // 如果不在 optionArray 中，就將符合條件的鍵值對從原始物件（item）複製到新物件（newItem）中
                newItem[key] = item[key];
            }
        }

        // 返回過濾後的新物件
        return newItem;
    });

    try {
        const parser = new Parser();
        const csv = parser.parse(optionsArray);

        // 創建 Blob 物件
        const blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]), csv], { type: 'text/csv;charset=UTF-8' });
        // 創建一個不顯示的連結
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = '報表.csv';
        // 添加連結到 DOM 並觸發點擊
        document.body.appendChild(link);
        link.click();

    } catch (err) {
        console.error(err);
    }
}

//下載訂單
const downloadOrderData = async () => {
    const requestBody = {
        buId: buId,
        startDate: startDate.value,
        endDate: endDate.value,
    }
    const reportResponse = await axios.post(`${import.meta.env.VITE_API_BASE}/pages/rest/product/findProductByBuIdAndDate`, requestBody)

    reportData.value = reportResponse.data;
    try {
        const parser = new Parser();
        const csv = parser.parse(orderData.value);


        // 創建 Blob 物件
        const blob = new Blob([new Uint8Array([0xEF, 0xBB, 0xBF]), csv], { type: 'text/csv;charset=UTF-8' });
        // 創建一個不顯示的連結
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = '訂單.csv';
        // 添加連結到 DOM 並觸發點擊
        document.body.appendChild(link);
        link.click();
    } catch (err) {
        console.error(err);
    }
}

//監聽pinia傳過來的數值是否有變化，反應到頁面上的顯示日期
watchEffect(() => {
    startDate.value = formatDate(dateInfo.startDate)
    endDate.value = formatDate(dateInfo.endDate)
})

//監聽pinia傳過來的數值是否有變化，會重新呼叫API取區間json
watch(range, (newVal, oldVal) => {
    if (newVal !== oldVal) {
        fetchData();
    }
});

onMounted(fetchData);

</script>
    
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Montserrat', sans-serif;
}

.body {
    border-radius: 2rem;
    width: 500px;
    height: 385px;
    display: flex;
    /* 水平置中內部div */
    justify-content: center;
    /* 垂直置中內部div */
    align-content: center;
    flex-wrap: wrap;
    background: rgba(255, 255, 255, 0.5);
    /* 半透明白色背景 */
    backdrop-filter: blur(30px);
    /* 模糊效果 */
    /* 邊框和其他裝飾性樣式 */
    border: 1px solid rgba(255, 255, 255, 0.3);
    padding-top: 0.8%;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

p {
    font-size: 0.875rem;
    margin-bottom: .5rem;
    line-height: 1.5rem
}

.card {
    border-radius: 1.5rem;
    background-color: #fff;
    width: 95%;
    height: 93%;

    /* 將內容（cardBody）上下置中 */
    justify-content: center;
    /* 將內容（cardBody）水平置中 */
    flex-wrap: wrap;
    align-content: center;
}

.cardBody {
    width: 95%;
    height: 93%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    /* 這將使子元素預設靠左對齊 */
}

.calHeader {
    margin: 10px;
    width: 90%;
    height: 20%;
    border-radius: 10px;
    align-self: center;
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    align-items: center;
    /* 讓子元素在垂直方向上居中 */
    justify-content: space-between;
    /*讓子元素在水平方向上有一定間隔 */

}

.calHeaderStart {
    border: 1px solid #33808B;
    padding: 10px;
    border-radius: 8px;
}

.calHeaderEnd {
    border: 1px solid #33808B;
    padding: 10px;
    border-radius: 8px;
}

.switchDownloadContainer {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

.switchLeftCard {
    float: left;
    width: 50%;
}

.switchContainer {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-evenly;
    padding: 20px;
}

.custom-switch {
    width: 60px;
    /* 設置寬度 */
    height: 30px;
    /* 設置高度 */
    color: #33808B;
}

.custom-switch:checked {
    background-color: #33808B;
    /* 開啟時的背景顏色 */
}

.downloadRightCard {
    float: right;
    width: 50%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.form-check-label {
    margin-left: 10px;
    /* 或者您可以根據需要調整數值 */
}
</style>