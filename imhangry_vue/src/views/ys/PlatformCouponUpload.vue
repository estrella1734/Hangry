<template>
    <div>
        <br>
        <h2>新增優惠券</h2>
        <br>
    </div>
    <div class="card">
        <br>
        <el-form :model="form" label-width="120px" class="form">
            <el-form-item label="優惠券名稱">
                <el-input v-model="form.title" />
            </el-form-item>
            <el-form-item label="優惠券折扣">
                <el-input-number v-model="form.discount" :min="1" :max="100"
                    @change="handleChange" />&nbsp%&nbsp(例如:折扣10%請填10)
            </el-form-item>
            <el-form-item label="抵用門檻">
                <el-input-number v-model="form.threshold" :min="0" :max="10000"
                    @change="handleChange2" />&nbsp元&nbsp(上限:10,000)
            </el-form-item>
            <el-form-item label="優惠券數量">
                <el-input-number v-model="form.amount" :min="1" :max="10000"
                    @change="handleChange3" />&nbsp張&nbsp(上限:10,000)
            </el-form-item>
            <el-form-item label="活動開始時間">
                <el-col :span="11">
                    <el-date-picker v-model="form.startDate" type="date" placeholder="Pick a date" style="width: 100%" />
                </el-col>
                <el-col :span="2" class="text-center">
                    <span class="text-gray-500">-</span>
                </el-col>
                <el-col :span="11">
                    <el-time-picker v-model="form.startDate" placeholder="Pick a time" style="width: 100%" />
                </el-col>
            </el-form-item>
            <el-form-item label="活動結束時間">
                <el-col :span="11">
                    <el-date-picker v-model="form.endDate" type="date" placeholder="Pick a date" style="width: 100%" />
                </el-col>
                <el-col :span="2" class="text-center">
                    <span class="text-gray-500">-</span>
                </el-col>
                <el-col :span="11">
                    <el-time-picker v-model="form.endDate" placeholder="Pick a time" style="width: 100%" />
                </el-col>
            </el-form-item>
            <el-form-item label="活動說明">
                <el-input v-model="form.description" type="textarea" />
            </el-form-item>
            <el-form-item>
                <el-button color="#577064" type="primary" @click="onSubmit">新增優惠券</el-button>
                <el-button color="#577064" onclick="location.href='/PlatformCoupon'">返回</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
  
<script lang="ts" setup>
import { reactive } from 'vue'
import axios from 'axios';
import Swal from 'sweetalert2';

const form = reactive({
    title: '活動特惠',
    discount: '10',
    threshold: '100',
    amount: '100',
    startDate: '',
    endDate: '',
    description: '恭喜你成為幸運兒',
})


const onSubmit = async () => {

    const result = await Swal.fire({
        icon: 'question',
        text: '確定要新增嗎？',
        allowOutsideClick: false,
        confirmButtonText: '確定',
        showCancelButton: true,
        cancelButtonText: '取消',
    });

    if (result.isConfirmed) {
        try {
            const response = await axios.post(`${import.meta.env.VITE_API_BASE}/coupon/upload`, form);
            console.log('Server Response:', response.data);

            if (response.data) {
                // 在這裡處理後端的回應，例如提示用戶操作成功
                await Swal.fire({
                    icon: 'success',
                    text: '新增成功',
                    confirmButtonText: '確定',
                });
                // 導回BuMenu頁面
                location.href = '/PlatformCoupon'
            } else {
                Swal.fire({
                    icon: "error",
                    text: "新增失敗",
                    confirmButtonText: "確定"
                }).then(function (result) {

                });
            }
        } catch (error) {
            // 在這裡處理請求錯誤，例如提示用戶操作失敗
            alert('發生錯誤：' + error.message);
        }
    }
}

import { ref } from 'vue'

const num = ref(85)
const handleChange = (value: number) => {
    console.log(value)
}

const num2 = ref(0)
const handleChange2 = (value: number) => {
    console.log(value)
}

const num3 = ref(1)
const handleChange3 = (value: number) => {
    console.log(value)
}
</script>
<style scoped>
.card {
    border-color: #577064;
    border-width: 5px;
}

.form {
    margin: 10px;
}

h2 {
    color: #577064;
    font-weight: bold;
}
</style>