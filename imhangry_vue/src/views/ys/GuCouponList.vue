<template>
    <body>
        <br>
        <h2>優惠券領取</h2>
        <h5>各優惠券限領取一次，請記得於結帳頁面帶入優惠代碼。</h5>
        <div class="container">
            <a href="javascript: void(0)" class="btn" @click="onReceiveAll">
                <span>一鍵領取</span>
                <svg width="13px" height="10px" viewBox="0 0 13 10">
                    <path d="M1,5 L11,5"></path>
                    <polyline points="8 1 12 5 8 9"></polyline>
                </svg>
            </a>
            <a href="javascript: void(0)" class="btn" onclick="location.href='/GuCoupon'">
                <span>返回優惠券</span>
                <svg width="13px" height="10px" viewBox="0 0 13 10">
                    <path d="M1,5 L11,5"></path>
                    <polyline points="8 1 12 5 8 9"></polyline>
                </svg>
            </a>
        </div>

        <br>
        <div class="page-content page-container" id="page-content">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title"></h4>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>活動名稱</th>
                                <th>折扣</th>
                                <th>抵用門檻</th>
                                <th>使用期間</th>
                                <th>說明</th>
                                <th>數量</th>
                                <th>領取</th>
                            </tr>
                        </thead>
                        <tbody v-for="(item, index) in Object.values(coupons)">
                            <tr>
                                <td>{{ item.title }}</td>
                                <td>{{ item.discount }}</td>
                                <td>{{ item.threshold }}</td>
                                <td>{{ formatDateRange(item.startDate, item.endDate) }}</td>
                                <td>{{ item.description }}</td>
                                <td>{{ item.amount }}</td>
                                <td><el-button color="#577064" v-if="!item.isReceived"
                                        @click="onSubmit(item.id, index)">領取</el-button>
                                    <el-button color="#577064" v-else disabled>已領取</el-button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</template>


<script setup>
defineProps(['name']);

import axios from 'axios';
import { onMounted, reactive } from 'vue';
import Swal from 'sweetalert2';
const formatDateTime = (dateTime) => {
    if (!dateTime) return '';
    const formattedDateTime = new Date(dateTime).toLocaleString('zh-TW', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
    });
    return formattedDateTime;
};

const formatDateRange = (startDate, endDate) => {
    const formattedStartDate = startDate ? formatDateTime(startDate) : '';
    const formattedEndDate = endDate ? formatDateTime(endDate) : '';
    return `${formattedStartDate} ~ ${formattedEndDate}`;
};
const onReceiveAll = async () => {
    const result = await Swal.fire({
        icon: 'question',
        text: '確定要一鍵領取嗎？',
        allowOutsideClick: false,
        confirmButtonText: '確定',
        showCancelButton: true,
        cancelButtonText: '取消',
    });

    if (result.isConfirmed) {
        try {
            const guId = 2;
            const response = await axios.post(`${import.meta.env.VITE_API_BASE}/coupon/receive/all/` + guId);
            console.log('Server Response:', response.data);

            if (response.data) {
                // 更新數據，將所有優惠券標記為已領取
                Object.values(coupons).forEach(item => item.isReceived = true);
                // 在這裡處理後端的回應，例如提示用戶操作成功
                await Swal.fire({
                    icon: 'success',
                    text: `您已經成功領取${response.data}優惠券囉!`,
                    confirmButtonText: '確定',
                }
                );

            } else {
                Swal.fire({
                    icon: "error",
                    text: "領取失敗",
                    confirmButtonText: "確定"
                }).then(function (result) {

                });
            }
        } catch (error) {
            Swal.fire({
                icon: "error",
                text: "你已經領取過這張優惠券囉!",
                confirmButtonText: "確定",
            }).then(function (result) {


            });
        }
    }
}

const onSubmit = async (id, index) => {

    const result = await Swal.fire({
        icon: 'question',
        text: '確定要領取嗎？',
        allowOutsideClick: false,
        confirmButtonText: '確定',
        showCancelButton: true,
        cancelButtonText: '取消',
    });

    if (result.isConfirmed) {
        try {
            const guId = 2;
            const response = await axios.post(`${import.meta.env.VITE_API_BASE}/coupon/receive/` + `${id}/` + guId);
            console.log('Server Response:', response.data);

            if (response.data) {

                // 在這裡處理後端的回應，例如提示用戶操作成功
                await Swal.fire({
                    icon: 'success',
                    text: '領取成功',
                    confirmButtonText: '確定',
                });
                // 更新對應的優惠券對象的 isReceived 屬性為 true
                coupons[index].isReceived = true;

            } else {
                Swal.fire({
                    icon: "error",
                    text: "領取失敗",
                    confirmButtonText: "確定"
                }).then(function (result) {
                    // 更新對應的優惠券對象的 isReceived 屬性為 true
                    coupons[index].isReceived = true;

                });
            }
        } catch (error) {
            Swal.fire({
                icon: "error",
                text: "你已經領取過這張優惠券囉!",
                confirmButtonText: "確定",
            }).then(function (result) {
                // 更新對應的優惠券對象的 isReceived 屬性為 true
                coupons[index].isReceived = true;

            });
        }
    }
}



const coupons = reactive({});

const fetchData = async () => {


    const response = await axios.get(`${import.meta.env.VITE_API_BASE}/coupon/platform`);

    console.log(response.data);
    Object.assign(coupons, response.data);

}

onMounted(fetchData);


</script>


<style scoped>
body {
    border-radius: 10px;
    width: 100%;
    height: 385px;
    max-height: 385px;
    /* 設定最大高度與 body 一致 */
    /* overflow-y: auto; */
    /* 當內容超出時顯示垂直捲軸 */
}


p {
    font-size: 0.875rem;
    margin-bottom: .5rem;
    line-height: 1.5rem
}



/* 給 thead 標籤設定樣式 */
thead {
    border-radius: 15px;
    /* 這樣子元素超出的部分就會被隱藏 */
    overflow: hidden;
}

/* 給 thead 內的 th 標籤設定樣式 */
thead th {
    background-color: #fff;
    /* 設定背景顏色 */
    border: none;
    /* 移除邊框 */
    min-width: 80px;
    text-align: center;
}

/* 設定表格樣式以去除內部間隙 */
table {
    border-collapse: separate;
    /* 使得 border-radius 生效 */
    border-spacing: 0;
    /* 移除 th 和 td 之間的空隙 */
}

/* 選擇性地設置 th 元素的樣式 */
th:first-child {
    border-top-left-radius: 15px;
}

th:last-child {
    border-top-right-radius: 15px;
}


.table,
.jsgrid .jsgrid-table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 1rem;
    background-color: transparent;
    text-align: center;

}


.table td,
.jsgrid .jsgrid-table td {
    font-size: 0.875rem;
    padding: .875rem 0.9375rem
}

.badge {
    border-radius: 30px;
    font-size: 12px;
    line-height: 1;
    padding: .375rem .5625rem;
    font-weight: normal;
}

.container {
    text-align: right;
}

.btn {
    position: relative;
    color: #000000;
    font-size: 1rem;
    text-transform: uppercase;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    transition: all 0.2s ease;
    padding: 12px 12px;
    display: inline-flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
}

.btn:before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    border-radius: 28px;
    background: #577064;
    width: 56px;
    height: 56px;
    transition: all 0.3s ease;
}

.btn span {
    position: relative;
    z-index: 1;
}

.btn svg {
    position: relative;
    top: 0;
    margin-left: 10px;
    fill: none;
    stroke-linecap: round;
    stroke-linejoin: round;
    stroke: #111111;
    stroke-width: 2;
    transform: translateX(-5px);
    transition: all 0.3s ease;
}

.btn:hover:before {
    width: 100%;
    background: #577064;
}

.btn:hover svg {
    transform: translateX(0);
}

.btn:hover,
.btn:focus {
    color: #ffffff;
}

h2 {
    color: #577064;
    font-weight: bold;
}
</style>