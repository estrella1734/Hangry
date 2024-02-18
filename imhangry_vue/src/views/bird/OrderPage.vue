<template>
        
    <div class="msg">
        感謝您的訂購
    </div>


        <div class="top">

            <div class="businessInfo">

                <div class="businessInfo-left">

                            <Card></Card>
                            <div style="padding-right: 20px;">
                                <el-avatar src="../../orderPageImage/Hangry.jpg" :size="120" />
                                
                            </div>
                            <!-- 如果要用再找我調css -->
                            <!-- <div class="bottom">
                                <div class="sale">
                                    <el-button size="small" type="danger" color="#ff5e7d">活動</el-button>
                                    <div class="title">不限品項買5送1</div>
                                    <div class="time">活動時間:{{ "2024-01-20" }}~{{ "2024-02-20" }}</div>
                                </div>
                            </div> -->

                </div>
                
                <div class="businessInfo-right">
                    <Carousel1></Carousel1>
                </div>

            </div>


            <!-- 這裡給你調整 -->
            <div v-show="orderPageStore.showCartBtn">
                <Cart></Cart>
            </div>

            <Customize></Customize>

            <div class="menu">
                <div class="category" v-for="category in productList" :key="category.id">
                    <div class="category-name">{{ category.categoryName }}</div>
                    <div class="product" v-for="product in category.products" :key="product.id"
                        @click="openDialog(product.id, category.id, product.price, product.name, category.categoryName, product.image)">
                        <div class="product-justify">
                            <el-avatar shape="square" :size="50" :src="'../../' + product.image" />
                            <div class="product-name">{{ product.name }}</div>
                        </div>
                        <div class="product-price">$ {{ product.price }}</div>
                    </div>
                </div>
            </div>

        </div>
</template>


<script setup lang='ts'>
import Card from '@/components/bird/OderPageChildren/Card.vue';
import Carousel1 from '@/components/bird/OderPageChildren/Carousel1.vue';
import Cart from '@/components/bird/OderPageChildren/Cart.vue';
import Customize from '@/components/bird/OderPageChildren/Customize.vue';
import { useOrderPageStore } from '@/stores/orderPage';
import { storeToRefs } from 'pinia';
import { onMounted } from 'vue';
import { useRoute } from 'vue-router';
const orderPageStore = useOrderPageStore()
const { productList } = storeToRefs(orderPageStore)

const { params: { id } } = useRoute()
orderPageStore.checkCartList()
onMounted(() => {

    if (id) {
        orderPageStore.getProducts(+id)

    } else {
        orderPageStore.getProducts()

    }

})

// defineExpose({Bid:id})


function openDialog(productId: number, categoryId: number, productPrice: number, productName: string, categoryName: string, image: string): void {

    //開啟表單並將子元件需要數據存入store
    orderPageStore.$patch((state: any) => {
        state.dialogFormVisible = true
        state.productData.productId = productId
        state.productData.categoryId = categoryId
        state.productData.productPrice = productPrice
        state.productData.productName = productName
        state.productData.categoryName = categoryName
        state.productData.image = image
    })
    orderPageStore.getCustomize(categoryId);
}
</script>
    
<style scoped>
.msg {
    border-radius: 0.7rem;
    background-color: #33808B;
    padding: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #ffffff;
    margin-top: 20px;
    margin-bottom: 20px;
}

.businessInfo {
    width: 101%;
    display: flex;
    flex-direction: row;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
    padding-top: 1%;
    padding-bottom: 2%;
}

.businessInfo-left {
    background-color: #ffffff;
    /* float: left; */
    display: flex;
    justify-content: center;
    align-items: center;
    /* border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem; */
}

.businessInfo-right {
    width: 100%;
    float: right;
}

.product .product-price {
    padding: 15px 0 0 0;
}

.product-justify .product-name {
    
    color: #000000;
    font-size: 16px;
    font-weight: 900;
    padding: 15px 0 0 20px;
}

.category-name {
    background-color: #ffffff;
    color: #fa4438;
    font-size: 24px;
    padding: 8px 16px;
    font-weight: 800;
}

.product .product-justify {
    display: flex;
    justify-content: left;

}

.category .product {
    background-color: #efefef;
    display: flex;
    justify-content: space-between;
    border-top: 1px solid rgba(68, 68, 68, 0.1);
    padding: 8px 16px;
    cursor: pointer;

}


.category {
    width: 100%;
    margin: 10px 0 10px 0;
    box-shadow: var(--el-box-shadow-light);
    box-sizing: border-box;
    break-inside: avoid;
    float: left;
    
}



.menu {
    clear: both;
    width: 100%;
    /* margin: 0px auto; */
    column-count: 3;
    padding-left: 2%;
    padding-right: 2%;
    /*欄數*/
    /* column-gap: 0px; */


}

.sale .title {
    padding: 0 0 0 20px;
    font-weight: 900;
}

.time {
    width: 100%;
    font-size: small;
    color: #616161;
    padding-top: 5px;
}

.sale {
    display: flex;
    justify-content: left;
    flex-wrap: wrap;
    cursor: pointer;

}

.bottom {
    width: 100%;
    background-color: pink;
    height: 60px;
    padding: 5px 0 0 30px;

}

.card {
    padding: 20px 0 0 0;
    border: 0px;
}



.info .right {
    background-color: aquamarine;
    width: 100%;
    box-shadow: var(--el-box-shadow-light);



}

.info .left {
    width: 30%;

    display: flex;
    justify-content: left;
    flex-wrap: wrap;
    box-shadow: var(--el-box-shadow);
}

.info {
    width: 1460px;
    height: 360px;
    margin-top: 15px;
    display: flex;
    justify-content: space-between;


}

.top {
    width: 99%;
    margin: 8px 0 0;
    border-radius: 10px;


}
</style>