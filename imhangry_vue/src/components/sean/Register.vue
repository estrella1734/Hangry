<template>
    <h3>會員註冊</h3>
    <form @submit="handleSubmit">
        <div class="mb-3">
            <label for="email" class="form-label">帳號(Email)</label>
            <input v-model="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" required>
            <div id="email" class="form-text"></div>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">密碼</label>
            <input v-model="password" type="password" class="form-control" id="password" required>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">姓名</label>
            <input v-model="name" type="text" class="form-control" id="name" required>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">手機</label>
            <input v-model="phone" type="text" class="form-control" id="phone" required>
        </div>
        <button type="submit" class="btn btn-primary">創建會員</button>
    </form>
</template>

<script setup>
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useStore } from 'vuex';
import router from '@/router/router';
import Swal from 'sweetalert2';
import { getCookieData } from '../sean/util/Gettes';

const store = useStore();
//使用者輸入的資料
const email = ref('');
const password = ref('');
const name = ref('');
const phone = ref('');

onMounted(() => {
    const userData = getCookieData("userData");
    if (userData && userData.id) {
        router.push({ name: "LoginHome", params: { id: userData.id } });
    }
})
//按下創建會員按鈕觸發的函式
const handleSubmit = async (event) => {
    event.preventDefault();

    const userData = {
        email: email.value,
        password: password.value,
        name: name.value,
        phone: phone.value,
    };
    const path = import.meta.env.VITE_API_GUESTUSERURL;
    const API_URL = `${path}/register`;
    try {
        const response = await axios.post(API_URL, userData);
        const success = response.data.success;
        const message = response.data.message;
        if (success) {
            Swal.fire({
                title: '歡迎您加入Hangry!',
                text: '下一步',
                icon: 'success',
                showConfirmButton: false,
                allowOutsideClick: false,
                timer: 1500,
            });
            router.push('/UserLogin');
        } else {
            Swal.fire({
                title: '建立失敗',
                text: message,
                icon: 'error',
                allowOutsideClick: false,
            });
        }
    } catch (error) {
        console.log("error", error);
    }
};

</script>