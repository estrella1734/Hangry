<template>
    <!-- <body> -->
    <br>
    <h2>商品列表</h2>
    <div class="container">
        <a href="javascript: void(0)" class="btn" onclick="location.href='/MenuUpload'">
            <span>新增商品</span>
            <svg width="13px" height="10px" viewBox="0 0 13 10">
                <path d="M1,5 L11,5"></path>
                <polyline points="8 1 12 5 8 9"></polyline>
            </svg>
        </a>
        <a href="javascript: void(0)" class="btn" onclick="location.href='/MenuUploadFile'">
            <span>新增商品(檔案上傳)</span>
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
                            <th>品項</th>
                            <th>品項(英)</th>
                            <th>價格</th>
                            <th>狀態</th>
                            <th>描述</th>
                            <th>圖片</th>
                            <th>修改</th>
                            <th>刪除</th>
                        </tr>
                    </thead>
                    <tbody v-for="item in Object.values(product)">
                        <tr>
                            <td>{{ item.name }}</td>
                            <td>{{ item.engName }}</td>
                            <td>{{ item.price }}</td>
                            <td>{{ item.status }}</td>
                            <td>{{ item.description }}</td>
                            <td>
                                <img :src="getImageUrl(item.image)" alt="Product Image"
                                    style="max-width: 100px; max-height: 100px;" />
                            </td>
                            <td>
                                <router-link :to="{ name: 'MenuUpdate', params: { id: item.id } }"><el-button
                                        color="#577064">修改</el-button></router-link>
                            </td>
                            <td><el-button color="#577064" type="primary" @click="remove(item.id)">刪除</el-button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- </body> -->
</template>


<script setup>
defineProps(['name']);

import axios from 'axios';
import { onMounted, reactive } from 'vue';
import Swal from 'sweetalert2';

const product = reactive({});
//商品列表

const getImageUrl = (image) => {
    if (!image || typeof image !== 'string') {
        console.log('Invalid image data');
        return `${import.meta.env.VITE_API_BASE}/default-image.jpg`;
    }

    if (image.startsWith('data:image')) {
        console.log('Using image as Base64');
        return image;
    }

    const encodedImagePath = encodeURIComponent(image);
    console.log('Using relative image path');
    console.log(encodedImagePath);
    return `${import.meta.env.VITE_API_BASE}/images/headshot/` + encodedImagePath;
};

const fetchData = async () => {
    try {
        const buId = 2;
        const response = await axios.get(`${import.meta.env.VITE_API_BASE}/product/all/` + buId);
        console.log(response.data);
        Object.assign(product, response.data);
    } catch (error) {
        // 處理錯誤
        console.error('Error fetching data:', error);

        // 顯示或處理錯誤，可以根據具體情況進行調整
        Swal.fire({
            icon: 'error',
            text: '發生錯誤: ' + error.message,
            confirmButtonText: '確定',
        });
    }

}
//刪除按鈕
const remove = async (id) => {
    const result = await Swal.fire({
        icon: 'question',
        text: '確定要刪除嗎？',
        allowOutsideClick: false,
        confirmButtonText: '確定',
        showCancelButton: true,
        cancelButtonText: '取消',
    });

    if (result.isConfirmed) {
        const buId = 2;
        const response = await axios.delete(`${import.meta.env.VITE_API_BASE}/product/delete/` + buId + `/` + `${id}`);
        console.log('response', response);

        await Swal.fire({
            icon: 'success',
            text: '刪除成功',
            confirmButtonText: '確定',
        });
    }
};



onMounted(fetchData);

</script>


<style scoped>
body {
    border-radius: 5px;
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


}


.table td,
.jsgrid .jsgrid-table td {
    font-size: 0.875rem;
    padding: .875rem 0.9375rem;
    text-align: center;
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