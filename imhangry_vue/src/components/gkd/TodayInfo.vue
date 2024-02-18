<template>
    <div class="container" :class="{ active: isActive }">

        <div class="form-container sales">

            <form>

                <span class="buIconContainer">
                    <img :src="'/buIconImage/'+ buIcon">
                    
                </span>
                <p>
                    加入日期
                <h2>{{ buJoinDate }}</h2>
                </p>
                <p>
                    商家評分
                <h2><font-awesome-icon :icon="['far', 'star']" />{{ buRate }}</h2>
                </p>
            </form>

        </div>

        <div class="form-container today">
            <form>

                <h1>本日概況</h1>
                <div class="todayQVContainer">


                    <div class="todayQVContainerLeft">
                        <p>累積訂單金額
                        <h2>{{ sum }}</h2>
                        </p>
                        <p>與前週同日相較
                        <h2>{{ weeksAgoRate }} %</h2>
                        </p>
                    </div>
                    <div class="todayQVContainerRight">
                        <p>本日訂單數
                        <h2>{{ orderCount }}筆</h2>
                        </p>
                        <p>
                            已付款比率
                        <h2>{{ payStatusRate }}%</h2>
                        </p>
                    </div>

                </div>

            </form>

        </div>

        <!-- Toggle Container -->
        <div class="toggle-container">
            <div class="toggle">

                <div class="toggle-panel toggle-left">

                    <h1>帳戶設定</h1>
                    <button class="btn btn-warning btn-lg" @click="handleButtonClick"
                        style="font-size: 14px; padding: 10px 25px; color: white; background-color: #33808B;">
                        修改帳戶 <font-awesome-icon :icon="['far', 'pen-to-square']" />
                    </button>
                    <button class="hidden" @click="toggleActive"> 回上頁 </button>
                </div>

                <div class="toggle-panel toggle-right">
                    <h1>Hello !</h1>
                    <br>

                    <h3>{{ buName }}</h3>

                    <br>

                    <button class="hidden" @click="toggleActive">帳戶設定</button>

                </div>

            </div>
        </div>
    </div>
</template>


<script setup>
//拿出使用者資料
const userString = sessionStorage.getItem('userInfo');
const user = JSON.parse(userString);
const buId = user.id;
const buIcon = ref();
const buJoinDate = ref();
const buRate = ref();

const buName = ref(user.name);
//本日訂單總額
const sum = ref(0);
//與七天前訂單總額相比增長率
const weeksAgoRate = ref(0);
//本日付款訂單數
const orderCount = ref(0);
//本日付款狀況
const payStatusRate = ref(0);


import axios from 'axios';
import Swal from 'sweetalert2';
import { onMounted, ref } from 'vue';

//控制todayInfo的開關切換
const isActive = ref(false);
function toggleActive() {
    isActive.value = !isActive.value;
}


//修改商家資訊的方法
const handleButtonClick = async () => {
    // 顯示 loading 畫面
    Swal.fire({
        title: '請稍候...',
        allowOutsideClick: false,
        allowEscapeKey: false,
        showConfirmButton: false,
        timer: 1500,
    });

    // 0.5 秒後執行後續操作
    setTimeout(async () => {
        try {
            // 發送請求並等待響應
            const response = await axios.get(`${import.meta.env.VITE_API_BASE}/pages/rest/businessUser/findInformation/` + buId);

            const userData = response.data;
            console.log(userData);

            // 使用獲得的資料構建Swal的內容
            Swal.fire({
                // title: '修改個人資訊',
                html: `
                <div class="buInfoBody">

                    <div class="buInfoCardBody">
                        <div class="buInfoHeader">
                            <h1>店家資訊修改</h1>
                        </div>
                        <div class="leftRightContainer">

                            <div class="buInfoLeftCard">
                                <div class="bILCC">
                                    <div class="inputRow">
                                        <span class="pbuInfo">聯絡電話</span>
                                        <input id="phone" class="swal2-input" placeholder="電話" value="${userData.phone}">
                                    </div>


                                    <div class="inputRow">
                                        <span class="pbuInfo">店家型態</span>
                                        <input id="businessType" class="swal2-input" placeholder="店家型態"
                                            value="${userData.businessType}">
                                    </div>




                                    <div class="inputRow">
                                        <span class="pbuInfo">詳細地址</span>
                                        <input id="address" class="swal2-input" placeholder="詳細地址" value="${userData.address}">
                                    </div>



                                    <div class="inputRowDate">
                                        <span class="pbuInfo">營業時間</span>

                                        <div class="datePick">

                                            <div class="inputContainer">
                                                <span>開始</span>
                                                <input type="time" id="operationTimeStart" class="swal2-input"
                                                    value=${userData.operationTime.substring(0, 5)}>
                                            </div>

                                            <div class="inputContainer">
                                                <span>結束</span>
                                                <input type="time" id="operationTimeEnd" class="swal2-input"
                                                    value=${userData.operationTime.substring(6, 11)}>
                                            </div>
                                            

                                        </div>

                                    </div>

                                    <div class="inputRow">
                                        <span class="pbuInfo">商家敘述</span>
                                        <textarea id="describe" class="swal2-textarea" placeholder="商家敘述"
                                            rows="6">${userData.describe}</textarea>
                                    </div>

                                </div>

                            </div>


                            <div class="buInfoRightCard">
                                <div class="buInfoIcon">
                                    <img src="/buIconImage/${userData.imageIcon}">    
                                </div>
                                <br>
                                <br>
                                <div>Hello,${userData.name}</div>
                                <br>
                                <br>
                                <div>加入日期：${userData.joinDate}</div>
                                <br>
                                <br>
                                <div>Shop Rate：${userData.rate}</div>
                            </div>
                        </div>
                    </div>
                `,
                showCancelButton: true,
                cancelButtonText: '取消',
                showConfirmButton: true,
                customClass: {
                    popup: 'gkdPopup',
                    confirmButton: 'custom-confirm-button',
                    cancelButton: 'custom-cancel-button',
                },
                preConfirm: () => {
                    // 表單提交邏輯
                    const phone = Swal.getPopup().querySelector('#phone').value;
                    const operationTime = ((Swal.getPopup().querySelector('#operationTimeStart').value) + '-' + (Swal.getPopup().querySelector('#operationTimeEnd').value));
                    const businessType = Swal.getPopup().querySelector('#businessType').value;
                    const address = Swal.getPopup().querySelector('#address').value;
                    const describe = Swal.getPopup().querySelector('#describe').value;
                    return { phone: phone, operationTime: operationTime, businessType: businessType, address: address, describe: describe };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    // console.log('提交的資料:', result.value.operationTime);
                    // 在這裡發送PUT請求更新數據
                    axios.put(`${import.meta.env.VITE_API_BASE}/pages/rest/businessUser/modify`, {
                        BuId: buId,
                        phone: result.value.phone,
                        operationTime: result.value.operationTime,
                        businessType: result.value.businessType,
                        address: result.value.address,
                        describe: result.value.describe,
                    }).then(response => {


                        // 處理響應
                        //TODO處理正確樣式
                        Swal.fire({
                            icon: 'success',
                            iconColor: '#F9BF29', // 修改成功圖示的顏色為綠色
                        });



                    }).catch(error => {
                        console.error('儲存API請求失敗:', error);
                        // 處理錯誤
                        Swal.fire({
                            title: '錯誤',
                            text: '從API儲存時發生錯誤',
                            icon: 'error',
                        });
                    });
                }
            });


        } catch (error) {
            console.error('讀取API請求失敗:', error);
            // 處理錯誤情況
            Swal.fire({
                title: '錯誤',
                text: '無法從API獲取資料',
                icon: 'error',
            });
        }
    }, 500); // 0.5 秒後執行

};


//javascript的new Date()轉成'yyyy-MM-dd'
function formatDate(date) {
    let day = date.getDate().toString();
    let month = (date.getMonth() + 1).toString(); // 加 1 因為月份是從 0 開始
    const year = date.getFullYear().toString();

    // 確保月和日都是兩位數
    day = day.length < 2 ? '0' + day : day;
    month = month.length < 2 ? '0' + month : month;

    return `${year}-${month}-${day}`;
}


// const currentTime = formatDate(new Date());//當前日期
// const currentTimeOne = formatDate(new Date(new Date().setDate(new Date().getDate() + 1)));//當前日期+1
const currentTime = '2024-01-01';//當前日期
const currentTimeOne = '2024-01-31';//當前日期+1

//7天前
// const currentTimeWeeksAgo = formatDate(new Date(new Date().setDate(new Date().getDate() - 7)));//當前日期7天前
// const currentTimeWeeksAgoOne = formatDate(new Date(new Date().setDate(new Date().getDate() - 6)));//當前日期7天前+1
const currentTimeWeeksAgo = '2024-02-14';//當前日期7天前
const currentTimeWeeksAgoOne = '2024-02-20';//當前日期7天前+1


//抓出本日概況四個資訊的方法
const fetchData = async () => {

    //取出當前時間訂單的金額欄位。
    const requestCurrentBody = {
        buId: buId,
        startDate: currentTime,
        endDate: currentTimeOne
    }
    const sumResponse = await axios.post(`${import.meta.env.VITE_API_BASE}/pages/rest/orderform/findTodayTotalFromOrderForm`, requestCurrentBody)
    const nowRevenue = sumResponse.data;

    //取出當前時間七天前的訂單金額欄位。
    const requestWeekBody = {
        buId: buId,
        startDate: currentTimeWeeksAgo,
        endDate: currentTimeWeeksAgoOne
    }
    const sumWeeksAgoResponse = await axios.post(`${import.meta.env.VITE_API_BASE}/pages/rest/orderform/findTodayTotalFromOrderForm`, requestWeekBody)
    const weeksAgoRevenue = sumWeeksAgoResponse.data;

    //取出訂單的付款欄位。
    const statusResponse = await axios.post(`${import.meta.env.VITE_API_BASE}/pages/rest/orderform/findTodayPSFromOrderForm`, requestCurrentBody)
    const payStatus = statusResponse.data;

    const response = await axios.get(`${import.meta.env.VITE_API_BASE}/pages/rest/businessUser/findInformation/` + buId);

    const userData = response.data;
    // console.log(userData);
    buIcon.value = userData.imageIcon
    buJoinDate.value = userData.joinDate
    buRate.value = userData.rate;


    //計算目前為止的訂單金額加總
    //JS的陣列計算，透過reduce方法可以計算出陣列內數值總和，後方的0數值位置的值會影響最後結果。
    // sum.value = data.reduce((acc, curr) => acc + curr, 0); -> accumulator,currentValue可以被簡寫
    sum.value = nowRevenue.reduce((accumulator, currentValue) => accumulator + currentValue, 0);

    weeksAgoRate.value = weeksAgoRevenue.reduce((acc, curr) => acc + curr, 0);

    //將目前的營業額與上週同期營業額做運算，算出增長率
    //增長率公式
    const returnRate = Math.round(((sum.value - weeksAgoRate.value) / weeksAgoRate.value) * 100);
    weeksAgoRate.value = returnRate;

    //運算訂單的付款率
    //付款率資料[1,1,0]->代表訂單有三筆，兩筆付款、一筆尚未
    let amount = payStatus.length;
    let payed = 0;
    let unPay = 0;
    payStatus.forEach(element => {
        if (element == 1) {
            payed++;
        } else {
            unPay++;
        }
    });

    orderCount.value = amount;
    payStatusRate.value = Math.round((payed / amount) * 100);



}

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

p {
    text-align: center;
}

h2 {
    text-align: center;
}

.container {
    background-color: #fff;
    border-radius: 2.5rem;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
    position: relative;
    overflow: hidden;
    width: 768px;
    max-width: 100%;
    min-height: 410px;
}

.container p {
    font-size: 14px;
    line-height: 20px;
    letter-spacing: 0.3px;
    margin: 20px 0;
}

.container span {
    font-size: 12px;
}

.container a {
    color: #333;
    font-size: 13px;
    text-decoration: none;
    margin: 15px 0 10px;
}

.container button {
    background-color: #4c5565;
    color: #fff;
    font-size: 12px;
    padding: 10px 45px;
    border: 1px solid transparent;
    border-radius: 8px;
    font-weight: 600;
    letter-spacing: 0.5px;
    text-transform: uppercase;
    margin-top: 10px;
    cursor: pointer;
}

.container button.hidden {
    background-color: transparent;
    border-color: #fff;
}

.container form {
    background-color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 0 40px;
    height: 100%;
}

.todayQVContainer {
    background-color: #fff;
    display: flex;
    align-items: center;
    justify-content: space-between;
    align-items: center;
}

.todayQVContainerLeft {
    float: left;
    padding: 10px;
    margin: 20px;
}

.todayQVContainerRight {
    float: right;
    padding: 10px;
    margin: 20px;
}

.container input {
    background-color: #eee;
    border: none;
    margin: 8px 0;
    padding: 10px 15px;
    font-size: 13px;
    border-radius: 8px;
    width: 100%;
    outline: none;
}

.form-container {
    position: absolute;
    top: 0;
    height: 100%;
    transition: all 0.6s ease-in-out;
}

.today {
    left: 0;
    width: 50%;
    z-index: 2;
}

.container.active .today {
    transform: translateX(100%);
}

.sales {
    left: 0;
    width: 50%;
    opacity: 0;
    z-index: 1;
}

.container.active .sales {
    transform: translateX(100%);
    opacity: 1;
    z-index: 5;
    animation: move 0.6s;
}

.toggle-container {
    position: absolute;
    top: 0;
    left: 50%;
    width: 50%;
    height: 100%;
    overflow: hidden;
    transition: all 0.6s ease-in-out;
    border-radius: 150px 0 0 100px;
    z-index: 900;
}

.container.active .toggle-container {
    transform: translateX(-100%);
    border-radius: 0 150px 100px 0;
}

.toggle {
    height: 100%;
    /* background: linear-gradient(to right, #33808B, #F9BF29); */
    background: #F9BF29;
    color: #fff;
    position: relative;
    left: -100%;
    height: 100%;
    width: 200%;
    transform: translateX(0);
    transition: all 0.6s ease-in-out;
}

/*控制動畫*/
.container.active .toggle {
    transform: translateX(50%);
}

/*控制本日慨況內容*/
.toggle-panel {
    position: absolute;
    width: 50%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 0 30px;
    text-align: center;
    top: 0;
    transform: translateX(0);
    transition: all 0.6s ease-in-out;
}

.toggle-left {
    transform: translateX(-200%);
}

.container.active .toggle-left {
    transform: translateX(0);
}

.toggle-right {
    right: 0;
    transform: translateX(0);
}

/*控制本日概況文字動畫向左消失*/
.container.active .toggle-right {
    transform: translateX(200%);
}
.buIconContainer img{
    /* width: 140px;
    height: 140px;
    border-radius: 1rem; */
    width: 150px;
    height: 150px;
    border: 1px solid;
    border-radius: 50%;
}
</style>