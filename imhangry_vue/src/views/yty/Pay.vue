<template>
        <h2 style="margin-top: 40px;">付款資訊</h2>
        <h5 style="margin-top: 40px;">取貨人資訊</h5>
        <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" v-model="name">
                <label for="floatingInput">姓名</label>
        </div>
        <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingPassword" placeholder="Password" v-model="phone">
                <label for="floatingInput">電話</label>
        </div>

        <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floating" placeholder="Password">
                <label for="floatingInput">備註</label>
        </div>

        <h5 style="margin-top: 40px;">付款方式</h5>
        <el-radio-group v-model="radio">
                <el-radio :label="1">現金</el-radio>
                <el-radio :label="2">信用卡</el-radio>
                <!-- <el-radio :label="3">Option C</el-radio> -->
        </el-radio-group>

        <h5 style="margin-top: 40px;">開立發票</h5>
        <el-radio-group v-model="invoice">
                <el-radio :label="4">紙本發票</el-radio>
                <el-radio :label="5">載具</el-radio><el-input v-model="input" v-show="invoice === 5" placeholder="Please input"
                        clearable />

        </el-radio-group>


        <div style="margin-top: 100px;"><el-button @click="goback"> 上一步 </el-button><el-button @click="pay"> 付款 </el-button>
        </div>
</template>

<script setup>
import axios from 'axios';
import { ref, onBeforeMount } from 'vue'
import { useRouter, useRoute } from 'vue-router';
import { getCookieData } from '@/components/sean/util/Gettes';
import {get} from 'vue-cookies'


const phone = ref('')

const total = ref('')
const name = ref('')
const radio = ref(1)
const invoice = ref()
const input = ref('')
const router = useRouter()
const route = useRoute()
const orderId = ref(133)
const cookieData = ref()
const guestUserPhone = ref()
const userData = getCookieData('userData');
const id = userData?.id;

console.log(route.params.id)


function getcookie() {
  cookieData.value = get('userData')
  console.log(cookieData.value)
  if (cookieData.value == null) {
    Swal.fire({
      icon: "question",
      title: "請先登入！",
      allowOutsideClick: false,
      confirmButtonText: '前往登入頁面'
    }).then(() => {
      route.push({ name: 'UserLogin' })
    });

    // 
  } else {

    cookieData.value = window.atob(cookieData.value)
    console.log(cookieData.value)
    phone.value = JSON.parse(cookieData.value).phone
    console.log(phone.value);
  }
}
getcookie();


 async function pay() {

        if (radio.value === 2) {
                total.value = 100

                window.location.href = `http://localhost:8080/ecpayCheckout/${total.value}`
                // window.open(`http://localhost:8080/ecpayCheckout/${total.value}`)
        }
        console.log(orderId.value)
                
                        try {
                                const response = await axios.get(`http://localhost:8080/return/${orderId.value}`);
                                console.log('response', response.data);  // 輸出伺服器回應的數據
                        } catch (error) {
                                console.error('錯誤：', error);
                        }
                
        router.push({path:'Orders'})



}


function goback() {
        return router.go(-1);
}
onBeforeMount(
async ()=>{
        const path = import.meta.env.VITE_API_GUESTUSERURL;
        const API_URL = `${path}/home/${id}`;
        const response = await axios.get(API_URL);
        console.log("response" , response)
        name.value = response.data.name
        input.value = response.data.invoice
        console.log(name.value)
        console.log(invoice.value)
})




</script>

<style>
.form-floating {
        margin-bottom: 100px;
}
</style>