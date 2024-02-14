
<template>
    <h3>會員登入</h3>
    <form @submit="handleSubmit">
        <div class="mb-3">
            <label for="email" class="form-label">帳號(Email)</label>
            <input v-model="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">密碼</label>
            <input v-model="password" type="password" class="form-control" id="password" required>
        </div>
        <button type="submit" class="btn btn-primary">登入</button>
    </form>
</template>
    
<script setup >
import { ref, onMounted } from 'vue';
import axios from 'axios';
import router from '@/router/router';
import Swal from 'sweetalert2';
import { getCookieData } from "../sean/util/Gettes"
onMounted(() => {
    const userData = getCookieData("userData");
    if (userData && userData.id) {
        router.push({ name: "LoginHome", params: { id: userData.id } });
    }
})
//使用者輸入的資訊
const email = ref('');
const password = ref('');

const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms));

//按下登入觸發的函式
const handleSubmit = async function (event) {
    event.preventDefault();

    const input = {
        email: email.value,
        password: password.value,
    };

    const path = import.meta.env.VITE_API_GUESTUSERURL;
    const API_URL = `${path}/login`;

    try {
        const response = await axios.post(API_URL, input, { withCredentials: true });
        const success = response.data.success;
        const message = response.data.message;

        if (success) {
            await sleep(500);
            const userData = getCookieData("userData");
            const id = userData.id;
            console.log('id:', id);

            Swal.fire({
                title: '登入成功',
                text: '返回首頁',
                icon: 'success',
                showConfirmButton: false,
                allowOutsideClick: false,
                timer: 1500,
                didClose: () => {
                    router.go({ name: "LoginHome", params: { id: userData.id } });
                }
            });

        } else {
            Swal.fire({
                title: '登入失敗',
                text: message,
                icon: 'error',
                allowOutsideClick: false,
            });
        }
    } catch (error) {
        console.log("error", error);
    }
}
</script>
    
<style></style>