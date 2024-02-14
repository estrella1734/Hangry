<template>
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
    <div class="col" v-for="{ id, fkBusinessId, total, businessUserName, orderId, paymentStatus } in orderFormInfo.list">
      <div class="card h-100">
        <div style="height: 40px; background-color: #0d6efd;" v-if="paymentStatus === 1"><a style="color: white;">付款完成</a>
        </div>
        <div style="height: 40px; background-color: #0d6efd;" v-else><a style="color: white; ">未付款</a></div>
        <img src="../../../orderPageImage/Hangry.jpg" class="card-img-top" alt=" " style="width: 50%; margin: auto;">
        <div class="card-body">
          <!-- <h5 class="card-title">{{spotId}} {{ spotTitle }}</h5> -->
          <p class="card-text"><a href="" @click="toOrderPage(id)">{{ businessUserName }}</a></p>
        </div>
        <div class="card-footer">
          <small class="text-body-secondary">總金額 ： {{ total }}</small>
        </div>
        <a @click="ordersDetail(orderId)" class="btn btn-primary">訂單詳細資訊</a>
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
const route = useRouter();

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
    guestUserId.value = JSON.parse(cookieData.value).id
    console.log(guestUserId.value);
  }
}
getcookie();

function toOrderPage(id) {
  route.push({ name: 'OrderPage', params: { id: id } })
}


async function ordersDetail(id) {
  route.push({ name: 'OrderDetail', params: { orderId: id } })
  try {

    console.log(id);
    const response = await axios.get('http://localhost:8080/OrderDetail/' + id);
    Object.assign(orderDetail, response.data)
    console.log(orderDetail);


  } catch (error) {
    console.log(error);
  }
}



async function orders() {
  try {
    const response = await axios.get(`http://localhost:8080/orders/${guestUserId.value}`);
    Object.assign(orderFormInfo, response.data)
    console.log(orderFormInfo);
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