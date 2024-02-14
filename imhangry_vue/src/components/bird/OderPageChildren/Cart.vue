<template>
    <div class="openCart">
        <el-badge :value="count" class="item" >
            <button type="button" class="btn btn-primary" @click="goCartPage">購物車</button>
        </el-badge>
    </div>

    <!-- <div v-for="p in cartList">{{ p }}</div> -->
</template>
    
<script setup lang='ts'>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useOrderPageStore } from '@/stores/orderPage'
const orderPageStore = useOrderPageStore()
const router = useRouter()
const count = ref(0)
orderPageStore.$subscribe((mutate, state) => {
    
    localStorage.setItem('cartList', JSON.stringify(state.cartList))
    orderPageStore.checkCartList()
    
    
    count.value = orderPageStore.cartList.length
    
})

function goCartPage(){
    router.push({
        name:'CartPage',
        query:{
            id:orderPageStore.businessUser.id
        }
    })
}


</script>
    
<style scoped>
.openCart{
    position: fixed;
    top :130px;
    left:1700px;
}
.btn-check:checked+.btn,
.btn.active,
.btn.show,
.btn:first-child:active,
:not(.btn-check)+.btn:active,
.btn{
    color: var(--bs-btn-active-color);
    background-color: #ff5e7d;
    border-color: #ff5e7d;
    
}

</style>