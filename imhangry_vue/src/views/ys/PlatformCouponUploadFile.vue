<template>
    <div>
        <br>
        <h2>新增優惠券(檔案)</h2>
        <br>
        <div class="card">
            <el-form label-width="120px" class="form">
                <div class="mb-3">
                    <h4><label for="formFile" class="form-label">請上傳檔案</label></h4>
                    <input class="form-control" type="file" id="formFile" @change="handleFileChange">
                    <br>
                    <h5>請上傳csv檔，資料請依固定格式輸入。</h5>
                </div>


                <el-form-item>
                    <el-button color="#577064" type="primary" @click="onSubmit">新增檔案</el-button>
                    <el-button color="#577064" onclick="location.href='http://localhost:5173/PlatformCoupon'">返回</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>
  
<script lang="ts" setup>
import { ref } from 'vue';
import axios from 'axios';
import Swal from 'sweetalert2';

// 綁定檔案的ref
const selectedFile = ref(null)

const onSubmit = async () => {
    // 檢查是否選擇了檔案
    if (!selectedFile.value) {
        await Swal.fire({
            icon: 'error',
            text: '請選擇檔案',
            confirmButtonText: '確定',
        });
        return
    }

    // 檢查檔案類型是否為CSV
    if (!isCsvFile(selectedFile.value.name)) {
        await Swal.fire({
            icon: 'error',
            text: '請選擇CSV檔案',
            confirmButtonText: '確定',
        });
        return
    }


    const formData = new FormData()
    formData.append('file', selectedFile.value)
    axios.post(`${import.meta.env.VITE_API_BASE}/coupon/upload/file`, formData, {
        headers: {
            'Content-Type': 'multipart/form-data',
        },
    })
        .then(response => {
            Swal.fire({
                icon: 'success',
                text: '新增成功',
                confirmButtonText: '確定',
            });
            // 導回BuMenu頁面
            location.href = 'http://localhost:5173/PlatformCoupon'
        })
        .catch(error => {
            Swal.fire({
                icon: "error",
                text: "新增失敗",
                confirmButtonText: "確定"
            });
            console.error(error)
        })
}
const handleFileChange = (event) => {
    selectedFile.value = event.target.files[0];
};

const isCsvFile = (fileName) => /\.csv$/.test(fileName.toLowerCase())
</script>
<style scoped>
.form {
    margin: 30px;
}

.card {
    border-color: #577064;
    border-width: 5px;
}

.form-label {
    color: #577064;
    font-weight: bold;
}

h2 {
    color: #577064;
    font-weight: bold;
}

h5 {
    color: #577064;
}
</style>