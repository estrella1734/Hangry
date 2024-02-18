<template>
    <div class="orderPageContainer">
        <h2 style="text-align: center; padding-top: 2%;" v-if="ordersexist">訂單</h2>
        <h2 style="text-align: center; padding-top: 2%;" v-else>查無訂單</h2>
        <!-- <button @click="orders">123456</button> -->
        <!-- <div class="demo-collapse">
        <el-collapse v-model="activeName" accordion v-for="{ id, fkBusinessId, total } in orderFormInfo.list">
            
            <el-collapse-item  :name="id" style="width: 100%;" >
              
                <template #title><div style="width: 100%;" class="div1"><span class="left">{{ fkBusinessId }}</span><span class="right">{{ total }}</span></div></template>                
                <div>
                   <ol v-for="(id,price) in orderFormInfo.list2">
                    <li>
                        {{ id }}
                    </li>
                   </ol>
                </div>
                <div>
                </div>
            </el-collapse-item>
        </el-collapse>
    </div>    -->
        <!-- <div style="height: 20px;"></div> -->

        <div class="row row-cols-1 row-cols-md-3 g-4" style="margin-top:10px ;">
            <div class="col"
                v-for="{ id, fkBusinessId, total, businessUserName, orderId, paymentStatus } in orderFormInfo.list">
                <div class="card h-100">
                    <div style="height: 40px; background-color: #33808B; display: flex; align-items: center; margin-bottom: 20px;"
                        v-if="paymentStatus === 1">

                        <a style="color: white; margin: auto;">付款完成</a>

                    </div>
                    <div style="height: 40px; background-color: #F9BF29; display: flex; align-items: center; margin-bottom: 20px;"
                        v-else>

                        <a style="color: white; margin: auto;">未付款</a>

                    </div>
                    <img src="/orderPageImage/Hangry.jpg" class="card-img-top" alt=" " style="width: 50%; margin: auto;">
                    <div class="card-body">
                        <!-- <h5 class="card-title">{{spotId}} {{ spotTitle }}</h5> -->
                        <p class="card-text"><a href="" @click.prevent="toOrderPage(fkBusinessId)">{{ businessUserName
                        }}</a></p>
                    </div>
                    <div class="card-footer">
                        <small class="text-body-secondary">總金額 ： {{ total }}</small>
                    </div>
                    <a @click="ordersDetail(orderId)" class="btn btn-secondary">訂單詳細資訊</a>
                </div>
            </div>
        </div>
    </div>
</template>
  
<script setup>
import axios from 'axios';
import { ref, reactive, onMounted } from 'vue'
import { get } from 'vue-cookies'
import { useRouter } from 'vue-router';
import Swal from 'sweetalert2';
const orderFormInfo = reactive({});
const orderDetail = reactive({});
const orderNo = reactive();
const cookieData = ref();
const guestUserId = ref();
const router = useRouter();
const ordersexist = ref(true);

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
            router.push({ name: 'UserLogin' })
        });

        // 
    } else {

        cookieData.value = window.atob(cookieData.value)
        console.log(cookieData.value)
        guestUserId.value = JSON.parse(cookieData.value).id
        console.log(guestUserId.value);
    }
}
getcookie();

function toOrderPage(id) {
    // console.log("asdwdqe", id);
    router.push({ name: 'OrderPage', params: { id: id } })
}


async function ordersDetail(id) {
    router.push({ name: 'OrderDetail', params: { orderId: id } })
    try {


        const response = await axios.get(`${import.meta.env.VITE_API_BASE}/OrderDetail/` + id);
        Object.assign(orderDetail, response.data)
        console.log(orderDetail);


    } catch (error) {
        console.log(error);
    }
}



async function orders() {
    try {
        const response = await axios.get(`${import.meta.env.VITE_API_BASE}/orders/${guestUserId.value}`);
        Object.assign(orderFormInfo, response.data)
        console.log("orderFormInfo = ", orderFormInfo.list.length);
        if (orderFormInfo.list.length == 0) {
            ordersexist.value = false
        }
        // console.log(Object.keys(orderFormInfo).length)

    } catch (error) {
        console.log(error);
    }
}
onMounted(() => {
    orders();
})

const activeName = ref('1')
</script>
    
<style scoped>
.orderPageContainer {
    padding-left: 2%;
    padding-right: 2%;
    border-radius: 1.5rem;
    background-color: #efefef;
}

.div1 {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

.left {
    order: 1;
    /* 控制左邊的順序 */
}

.right {
    order: 2;
    /* 控制右邊的順序 */
}

.card {
    margin: auto;
    text-align: center;
}
</style>