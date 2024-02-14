<template>
  <div style="display: flex;">
    <div style="width: 20%; text-align: center; margin-right: 10px;"><img src="../../../orderPageImage/Hangry.jpg"
        style="width: 80%; margin: auto; margin-top: 20px;">
      <div style=" margin-top: 15px;  ">好喝一號店</div>
    </div>
    <div style="width: 75%;">
      <el-table :data="orderDetail.detail" border height=auto :summary-method="getSummaries" show-summary
        style="width: 100%; margin-top: 20px">
        <!-- <el-table-column prop="amount" label="ID" width="180" /> -->
        <el-table-column prop="name" label="商品名稱" width="180" />
        <el-table-column prop="describe" label="商品選項" />
        <el-table-column prop="price" label="商品單價" />
        <el-table-column prop="amount" label="數量" />
        <el-table-column prop="productTotal" label="總計" />
      </el-table>
    </div>
  </div>
  <!-- <ul class="list-group list-group-horizontal">
        <li class="list-group-item">商品名稱</li>
        <li class="list-group-item">商品價格</li>
        <li class="list-group-item">數量</li>
      </ul>
    
   
      <ul class="list-group list-group-horizontal-sm" v-for="{ price, amount, index }  in orderDetail.detail"
        :key="index">
       <li class="list-group-item">{{ price }}</li>
        <li class="list-group-item">{{ price }}</li>
        <li class="list-group-item">{{ amount }}</li>
      </ul> -->
</template>
    
<script setup lang="ts">
import { onBeforeMount, onMounted, reactive, ref } from 'vue';
import axios from 'axios';
// import { TableColumnCtx } from 'element-plus'
// console.log(window.location.href);
const requstId = ref(window.location.pathname)
const orderDetail = reactive({ detail: undefined });
const businessName = ref("");

async function ordersDetail() {
  try {
    const response = await axios.get('http://localhost:8080' + requstId.value);
    Object.assign(orderDetail, response.data)
    businessName.value = response.data.detail[0].businessUserName;
    console.log(response.data);

  } catch (error) {
    console.log(error);
  }
}


onMounted(() => {
  ordersDetail();
})





const getSummaries = (param) => {
  const { columns, data } = param;
  const sums = [];

  columns.forEach((column, index) => {
    if (index === 0) {
      sums[index] = 'Total Cost';
      return;
    }

    const values = data.map((item) => Number(item[column.property]));

    if (!values.some((value) => isNaN(value))) {
      if (index == 4) {
        sums[index] = ` ${values.reduce((prev, curr) => {
          const value = Number(curr);
          if (!isNaN(value)) {
            return prev + value;
          } else {
            return prev;
          }
        }, 0)}`;
      } else {
        sums[index] = '';
      }
    }
  });

  return sums;
};



console.log(requstId);
</script>
    
<style></style>