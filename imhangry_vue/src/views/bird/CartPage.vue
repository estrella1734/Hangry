<template>
    <update></update>
    <div class="container">
        <div class="page">
            <div class="miseInfo" style="background-color: #efefef;">
                <div class="miseName">{{ businessUser.brandName + businessUser.name }}</div>
                <div class="miseBottom pointer">
                    <div class="phoneIcon">
                        <el-icon :size="15">
                            <Phone />
                        </el-icon>
                    </div>
                    <div class="misePhone">{{ businessUser.phone }}</div>
                </div>
            </div>
            <div class="take" style="background-color: #efefef;">
                <div class="form-check takeBtn">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"
                        value="takeOut" v-model="pickup">
                    <label class="form-check-label" for="flexRadioDefault1">
                        外帶<span class="span">(約30分鐘)</span>
                    </label>
                </div>
                <div v-if="pickup == 'takeOut'" class="takeOut" >
                    <div class="confirmAdd">請確認地址:</div>
                    <div class="address">{{ businessUser.city + businessUser.dist + businessUser.address }}</div>
                </div>
                <div class="form-check deliBtn" >
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2"
                        value="delivery" v-model="pickup">
                    <label class="form-check-label" for="flexRadioDefault2">
                        外送<span class="span">(約30分鐘)</span>
                    </label>
                </div>
                <div v-if="pickup == 'delivery'" class="delivery" >
                    <div class="confirmAdd">請選擇地址:</div>
                    <div class="address select">
                        <select class="form-select" v-model="selectAddress">
                            <option v-for="address, index in addressList" :key="address.id" :value="index">{{ address.city +
                                address.dist + address.address }}</option>
                        </select>
                    </div>
                </div>

                <div class="time">
                    <div class="timeTitle" >預定時間</div>
                    <div class="timeSelect">
                        <el-date-picker v-model="selectedDate" type="date" placeholder="Pick a date"
                            :disabled-date="disabledDate" @change="changeTime" />
                        <el-time-select v-model="selectedTime" :start="startTime" step="00:10" end="17:00"
                            placeholder="Select time" />
                    </div>
                </div>
            </div>
            <div class="cartList">
                <div class="cartBorder" style="background-color: #efefef;">
                    <div class="title">購物內容</div>
                    <div v-for="product, index in cartList" :key="product" class="productCard" style="padding-bottom: 5px;">
                        <template v-if="product.businessUserId == id">
                            <div class="left">
                                <div class="productName">{{ product.productName }}</div>
                                <div class="customizes">
                                    <el-space :size="10" spacer="/" class="space">
                                        <div v-for="custom in product.customizes.sort()" class="custom">{{
                                            custom.split(':')[1] }}
                                        </div>
                                        <div class="custom">${{ product.productPrice + product.extraPrice }}</div>
                                        <div class="custom">{{ product.amount }}份</div>
                                    </el-space>
                                </div>
                            </div>
                            <div class="right">
                                <div class="tempPrice">$ {{ product.totalPrice }}</div>
                                <div class="pointer" @click="updateProduct(index)"><el-icon>
                                        <EditPen />
                                    </el-icon></div>
                                <div class="pointer" @click="deleteProduct(index)"><el-icon>
                                        <Delete />
                                    </el-icon></div>
                            </div>
                        </template>
                    </div>
                </div>
            </div>
            <div class="coupon" style="background-color: #efefef;">
                <div class="cInner" >
                    <div class="confirmAdd" >選擇折價券:</div>
                    <div class="couponSelect">

                        <select class="form-select" v-model="selectCoupon" @change="checkDiscount($event)">
                            <option value="-1">選擇折價券</option>
                            <option v-for="coupon in couponList" :key="coupon.id" :value="coupon.id">{{ 100 -
                                coupon.discount
                            }}折優惠,須滿{{ coupon.threshold }}元,剩餘{{ coupon.count }}</option>
                        </select>
                        <div v-if="flag1" class="warn"><el-icon color="red">
                                <WarningFilled />
                            </el-icon>不符合此資格</div>
                    </div>
                </div>
            </div>
            <div class="totalPrice" style="background-color: #efefef;">
                <div class="totalLeft">合計</div>

                <div class="totalRight">
                    <div :class="{ line: flag2 }">$ {{ total }}</div>
                    <div v-if="flag2">$ {{ discountPrice }}</div>
                </div>


            </div>
            <div class="buttons">
                <button type="button" class="btn btn-secondary customBtn" @click="back">回上一頁</button>
                <button type="button" class="btn btn-dark customBtn" @click="sendOrder">確認</button>
            </div>
        </div>
    </div>
</template>
    
<script setup lang="ts">
import { ref, onMounted, computed } from 'vue';
import { useOrderPageStore } from '@/stores/orderPage';
import { useRoute, useRouter } from 'vue-router';
import { storeToRefs } from 'pinia';
import axios from 'axios';
import update from '@/components/bird/CartPageChildren/updateProduct.vue'

const router = useRouter()
const pickup = ref('takeOut')
const { query: { id } } = useRoute()
const orderPageStore = useOrderPageStore()
const { businessUser, cartList, addressList, couponList } = storeToRefs(orderPageStore)



const total = computed(() => {
    let sum = 0

    for (let i = 0; i < cartList.value.length; i++) {
        if (cartList.value[i].businessUserId == id)
            sum += cartList.value[i].totalPrice
    }


    return sum
})


// watch(total,()=>{

//         for(let i = 0; i < couponList.value.length;i++){
//             if(selectCoupon.value ==couponList.value[i].id){
//                 discountPrice.value = total.value*(100-couponList.value[i].discount)/100
//                 console.log(discountPrice.value);

//             }
//         }

// })

const discountPrice = ref(total.value)
function updateProduct(index:number) {
    const cartData = cartList.value[index]

    orderPageStore.$patch((state) => {
        state.dialogFormVisible2 = true
        state.productData.productId = cartData.productId
        state.productData.categoryId = cartData.category
        state.productData.productPrice = cartData.productPrice
        state.productData.productName = cartData.productName
        // state.productData.categoryName = categoryName
        state.productData.image = cartData.image
        state.productData.indexForUpdate = index
        state.productData.extraPrice = cartData.extraPrice
    })
    orderPageStore.getCustomize(cartData.category);


}
function deleteProduct(index:number) {

    cartList.value.splice(index, 1)
    localStorage.setItem('cartList', JSON.stringify(cartList.value))



    if (localStorage.getItem('cartList') == '[]') {
        router.replace('OrderPage')
    }

}

//select option
const selectAddress = ref(0)

const selectCoupon = ref(-1)

//time Selector
const time = new Date()
function todayTimeHandler(time) {
    const minute = time.getMinutes()
    const temp = new Date(time.setMinutes(Math.ceil(minute / 10) * 10 + 30))
    return temp.getMinutes() == 0 ? temp.getHours() + ":" + temp.getMinutes() + 0 : temp.getHours() + ":" + temp.getMinutes()

}



const startTime = ref(todayTimeHandler(time))


const selectedDate = ref(new Date())
const selectedTime = ref(startTime.value)
const disabledDate = (time) => {
    return time.getTime() < Date.now() - 60 * 60 * 24 * 1000
}

function changeTime(date) {

    if (isDatesEqual(date, new Date())) {
        startTime.value = todayTimeHandler(time)
        selectedTime.value = startTime.value
        return
    }
    startTime.value = '09:00'
    selectedTime.value = '09:00'
}

//比較日期忽略時間
function isDatesEqual(date1, date2) {
    return date1.getFullYear() === date2.getFullYear() &&
        date1.getMonth() === date2.getMonth() &&
        date1.getDate() === date2.getDate();
}

async function sendOrder() {
    let data = {}
    console.log(cartList.value);
    
    if (!flag2.value) {
        data = {
            fkBusinessId: id,
            fkGuestId: cartList.value[0].userId,
            paymentStatus: 0,
            pickup: pickup.value,
            total: total.value,
            address: selectedAddress()
        }
    } else {
        data = {
            couponId: selectCoupon.value,
            fkBusinessId: id,
            fkGuestId: cartList.value[0].userId,
            paymentStatus: 0,
            pickup: pickup.value,
            total: discountPrice.value,
            address: selectedAddress()
        }
    }


    console.log(data.fkGuestId,"data");
    try {
        //修改優惠券
        if (selectCoupon.value != -1) {
            const response0 = await axios.delete(`${import.meta.env.VITE_API_BASE}/orderPage/coupon/${selectCoupon.value}`)
        }
        //orderForm
        const response1 = await axios.post(`${import.meta.env.VITE_API_BASE}/orderPage/cart`, data)
        console.log(response1.data.id);
        
        //orderDetail
        const response2 = await axios.post(`${import.meta.env.VITE_API_BASE}/orderPage/cart/detail/${response1.data.id}`, cartList.value)

        //清除localStorage
        cartList.value.splice(0)
        localStorage.setItem('cartList', JSON.stringify(cartList.value))
        router.push({
            name: 'Pay', params: {
                id: response1.data.id
            }
        })
    } catch (error) {
        console.log(error);

    }

}

//不符合資格提示
const flag1 = ref(false)
//顯示折扣
const flag2 = ref(false)
defineExpose({ flag1, flag2, selectCoupon })
function checkDiscount(event) {


    if (selectCoupon.value == -1) {
        flag1.value = false
        flag2.value = false
        return
    } else {
        for (let i = 0; i < couponList.value.length; i++) {
            if (couponList.value[i].id == event.target.value) {
                //選到選項後確認
                if (couponList.value[i].threshold > total.value) {

                    flag1.value = true
                    flag2.value = false
                    return
                } else {
                    discountPrice.value = Math.ceil(total.value * (100 - couponList.value[i].discount) / 100)
                    flag1.value = false
                    flag2.value = true
                }


            }

        }

    }
}

function selectedAddress() {
    for (let i = 0; i < addressList.value.length; i++) {
        if (addressList.value[i].index == selectAddress.value) {
            return addressList.value[i].city + addressList.value[i].dist + addressList.value[i].address
        }

    }
}

function back() {
    router.go(-1)
}

onMounted(() => {
    orderPageStore.getBusinessUser(+id)
    orderPageStore.getAddressList()
    orderPageStore.getCouponList()
    console.log(cartList.value);
})
</script>
    
<style scoped>
.form-select {
    width: 300px;
}

.line {
    text-decoration: line-through;
}

.warn {
    margin: 10px 0 0 5px;
    width: 200px;
}

.couponSelect {
    display: flex;
    justify-content: center;
}

.select {
    margin: 0 0 0 20px;
    width: 800px;
}

.span {
    font-size: 14px;
}

.takeOut,
.delivery {
    display: flex;
    justify-content: left;
    align-items: center;
}

.takeOut .address {
    background-color: #f8f8f8;
    margin: 0 0 0 20px;

    padding: 20px 40px 0 40px;
    /* width: 80%; */
    height: 60px;
    border-radius: 20px;
    /* border: 1px solid black; */

}

.time div {
    margin-top: 10px;
}

.time :deep(.el-select__wrapper.is-filterable.el-tooltip__trigger.el-tooltip__trigger) {
    width: 220px;
}

.customBtn {
    width: 350px;
    height: 50px;
    margin: 20px;
    font-size: 24px;
}

.buttons {
    margin: 10px 0 30px 0;
    display: flex;
    justify-content: space-between;

}

.totalRight {
    margin: 20px 120px 0 0;
}

.totalLeft {
    margin: 20px 0 20px 80px;
    /* padding: 20px 0 0 0; */
}

.totalLeft,
.totalRight {
    font-size: 24px;
    font-weight: 900;
    color: #33808B;


}

.cInner .confirmAdd {
    font-weight: 900;
}

.cInner div {
    padding: 0 10px;
}

.coupon .cInner {
    margin: 20px 0 20px 40px;
    display: flex;
    justify-content: left;
    align-items: center;
}

.coupon {
    width: 875px;
    /* background-color: #fa4438; */
    border-radius: var(--el-border-radius-base);
    box-shadow: var(--el-box-shadow-lighter);
    margin: 15px 0 0 0;
}

.totalPrice {
    width: 875px;
    box-shadow: var(--el-box-shadow-lighter);
    margin: 20px 10px 10px 10px;
    border-top: 1px solid rgba(68, 68, 68, 0.1);
    display: flex;
    justify-content: space-between;
    border-radius: var(--el-border-radius-base);

}

.tempPrice {
    width: 150px;
    margin: 20px 20px 0 0;
}

.right .pointer {
    margin: 15px 15px 0 0;
}

.space {
    color: #616161
}

.customizes .custom {
    color: #616161;
    font-size: 12px;

}

.customizes {
    margin: 0 0 10px 15px;
}

.left .productName {
    padding: 10px 0 0 20px;
    font-size: 18px;
    font-weight: 800;
}

.right {
    display: flex;
    justify-content: right;
}

.left .customizes {
    display: flex;
    justify-content: left;
}

.productCard .right {
    width: 160px;

}

.productCard .left {
    width: 630px;

}

.productCard {
    display: flex;
    justify-content: space-between;
    width: 800px;
    background-color: #f8f8f8;
    margin: 10px 0 10px 0;
}

.cartBorder .title {
    font-weight: 900;
    font-size: 24px;

}

.cartBorder {
    padding: 20px 0 20px 35px;
}

.cartList {
    width: 875px;
    margin: 15px 0 0 0;
    border-radius: var(--el-border-radius-base);
    box-shadow: var(--el-box-shadow-lighter);
   /* padding-bottom: 20px;*/

}

.form-check-label {
    font-weight: 900;
}

.form-check,
.delivery,
.takeOut,
.time {
    margin: 20px 0 0 30px;
}

.take {
    width: 875px;
    height: 350px;
    margin: 15px 0 0 0;
    border-radius: var(--el-border-radius-base);
    box-shadow: var(--el-box-shadow-lighter);

}

.pointer {
    cursor: pointer;
}

.miseInfo .misePhone {
    padding: 2px 0 0 10px;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 14px;

}

.phoneIcon {
    padding: 2px;
}

.miseBottom {
    display: flex;
    justify-content: left;
    padding: 0 0 0 50px;
}

.miseInfo .miseName {
    margin: 15px 0 0 50px;
    color: #33808B;
    font-size: 24px;
    font-weight: 900;
}

.miseInfo {
    width: 875px;
    height: 95px;
    margin: 20px 0 0 0;
    border-radius: var(--el-border-radius-base);
    box-shadow: var(--el-box-shadow-lighter);
}

.container .page {
    width: 1460px;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;


}

.container {
    width: 1920px;
    display: flex;
    justify-content: center;
    border-radius: 2rem;
    /* 半透明白色背景 */
    background: rgba(255, 255, 255, 0.1);
    /* 模糊效果 */
    backdrop-filter: blur(30px);
    /* 邊框和其他裝飾性樣式 */
    border: 1px solid rgba(255, 255, 255, 0.3);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding-top: 0.8%;
}
</style>