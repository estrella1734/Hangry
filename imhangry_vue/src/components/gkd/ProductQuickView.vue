<template>
    <body>
        <div class="page-content page-container" id="page-content">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title"></h4>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>商品</th>
                                <th>#ID</th>
                                <th>數量</th>
                                <th>分類</th>
                                <th>售價</th>
                            </tr>
                        </thead>
                        <tbody v-for="item in Object.values(order)">
                            <tr>
                                <td>{{ item.productName }}</td>
                                <td>{{ item.productId }}</td>
                                <td>{{ item.totalSales }}</td>
                                <td>{{ item.categoryId }}</td>
                                <td>{{ item.price }}</td>
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

const order = reactive({});

//拿出使用者資料
const userString = sessionStorage.getItem('userInfo');
const user = JSON.parse(userString);
const buId = user.id;

const fetchData = async () => {

    const requestBody = {
        buId: buId,
        startDate: '2023-07-01',
        endDate: '2024-02-28',
    }
    //TODO改成env呼叫
    const response = await axios.post(`${import.meta.env.VITE_API_BASE}/pages/rest/product/productQuickView`, requestBody)

    Object.assign(order, response.data);
}

onMounted(fetchData);

</script>


<style scoped>
body {
    border-radius: 2rem;

    width: 768px;
    height: 385px;
    max-height: 385px;
    /* 設定最大高度與 body 一致 */
    overflow-y: auto;
    /* 當內容超出時顯示垂直捲軸 */
}


p {
    font-size: 0.875rem;
    margin-bottom: .5rem;
    line-height: 1.5rem
}

.card {
    background-color: #33808B;
    /* TODO做一個漸層色 */
    
    
}

.card-body{
    background-color: #33808B;
    
}

/* 給 thead 標籤設定樣式 */
thead {
    border-radius: 2rem;
    /* 這樣子元素超出的部分就會被隱藏 */
    overflow: hidden;
}

/* 給 thead 內的 th 標籤設定樣式 */
thead th {
    padding: 20px;
    background-color: #efefef;
    text-align: center;
    /* 設定背景顏色 */
    border: none;
    /* 移除邊框 */
}

tbody tr td{
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
    border-top-left-radius: 1.5rem;
}

th:last-child {
    border-top-right-radius: 1.5rem;
}

.table,
.jsgrid .jsgrid-table {
    /* padding: 20px; */
    /* margin: 20px; */
    width: 100%;
    max-width: 100%;
    margin-bottom: 1rem;
    background-color: transparent;
}
.table td,
.jsgrid .jsgrid-table td {
    /* padding: 20px; */
    /* margin: 20px; */
    font-size: 0.875rem;
    padding: .875rem 0.9375rem
}
</style>