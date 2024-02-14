<template>

    <div class="meanness">
    <el-dialog v-model="dialogFormVisible2" :title="productData.productName" width="400px" @close="clearData"
    @open="backfill">
        <el-form label-position="top">
            <div class="formItem">
                <el-form-item :label="custom.customizeName" v-for="(custom, index) in customizeList" :key="custom.id">
                    <template v-if="index == 0">
                        <div v-for="option in custom.customizeOption" :key="option.id">
                            <template v-if="custom.customizeName == '加料'">
                                <input type="checkbox" class="btn-check" :name="custom.customizeName" v-model="data.op4"
                                    :value="option.id" :id="option.custOptionName" autocomplete="off">
                                <label class="btn btn-outline-primary" :for="option.custOptionName">{{
                                    option.custOptionName }}<div v-if="option.extraPrice">+{{ option.extraPrice }}元</div>
                                </label>
                            </template>
                            <template v-else>
                                <input type="radio" class="btn-check" :name="custom.customizeName" v-model="data.op0"
                                    :value="option.id" :id="option.custOptionName" autocomplete="off">
                                <label class="btn btn-outline-primary" :for="option.custOptionName"
                                    @click.prevent="customizeOption(custom.id, option.id, custom.customizeName, option.custOptionName, option.extraPrice, index)">{{
                                        option.custOptionName }}<div v-if="option.extraPrice">+{{ option.extraPrice }}元</div>
                                </label>
                            </template>
                        </div>
                    </template>
                    <template v-else-if="index == 1">
                        <div v-for="option in custom.customizeOption" :key="option.id">
                            <template v-if="custom.customizeName == '加料'">
                                <input type="checkbox" class="btn-check" :name="custom.customizeName" v-model="data.op4"
                                    :value="option.id" :id="option.custOptionName" autocomplete="off">
                                <label class="btn btn-outline-primary" :for="option.custOptionName">{{
                                    option.custOptionName }}<div v-if="option.extraPrice">+{{ option.extraPrice }}元</div>
                                </label>
                            </template>
                            <template v-else>
                                <input type="radio" class="btn-check" :name="custom.customizeName" v-model="data.op1"
                                    :value="option.id" :id="option.custOptionName" autocomplete="off">
                                <label class="btn btn-outline-primary" :for="option.custOptionName"
                                    @click.prevent="customizeOption(custom.id, option.id, custom.customizeName, option.custOptionName, option.extraPrice, index)">{{
                                        option.custOptionName }}<div v-if="option.extraPrice">+{{ option.extraPrice }}元</div>
                                </label>
                            </template>
                        </div>
                    </template>
                    <template v-else-if="index == 2">
                        <div v-for="option in custom.customizeOption" :key="option.id">
                            <template v-if="custom.customizeName == '加料'">
                                <input type="checkbox" class="btn-check" :name="custom.customizeName" v-model="data.op4"
                                    :value="option.id" :id="option.custOptionName" autocomplete="off">
                                <label class="btn btn-outline-primary" :for="option.custOptionName"
                                @click="customizeOption(custom.id, option.id, custom.customizeName, option.custOptionName, option.extraPrice, index)">{{
                                    option.custOptionName }}<div v-if="option.extraPrice">+{{ option.extraPrice }}元</div>
                                </label>
                            </template>
                            <template v-else>
                                <input type="radio" class="btn-check" :name="custom.customizeName" v-model="data.op2"
                                    :value="option.id" :id="option.custOptionName" autocomplete="off">
                                <label class="btn btn-outline-primary" :for="option.custOptionName"
                                    @click.prevent="customizeOption(custom.id, option.id, custom.customizeName, option.custOptionName, option.extraPrice, index)">{{
                                        option.custOptionName }}<div v-if="option.extraPrice">+{{ option.extraPrice }}元</div>
                                </label>
                            </template>
                        </div>
                    </template>
                    <template v-else>
                        <div v-for="option in custom.customizeOption" :key="option.id">
                            <template v-if="custom.customizeName == '加料'">
                                <input type="checkbox" class="btn-check" :name="custom.customizeName" v-model="data.op4"
                                    :value="option.id" :id="option.custOptionName" autocomplete="off">
                                <label class="btn btn-outline-primary" :for="option.custOptionName">{{
                                    option.custOptionName }}<div v-if="option.extraPrice">+{{ option.extraPrice }}元</div>
                                </label>
                            </template>
                            <template v-else>
                                <input type="radio" class="btn-check" :name="custom.customizeName" v-model="data.op3"
                                    :value="option.id" :id="option.custOptionName" autocomplete="off">
                                <label class="btn btn-outline-primary" :for="option.custOptionName"
                                    @click.prevent="customizeOption(custom.id, option.id, custom.customizeName, option.custOptionName, option.extraPrice, index)">{{
                                        option.custOptionName }}<div v-if="option.extraPrice">+{{ option.extraPrice }}元</div>
                                </label>
                            </template>
                        </div>
                    </template>
                </el-form-item>
            </div>
            <!-- <div>{{ data.customizes }}</div> -->
            <span class="dialog-footer">
                <div class="footer-left">
                    <div class="footer-price">總金額{{ totalPrice }}元</div>
                    <div class="footer-count"><el-input-number v-model="num" :min="1" :max="20" @change="handleChange"
                            :value-on-clear="1" />
                    </div>
                </div>
                <div class="footer-right"><button type="button" class="btn btn-primary btn-submit"
                        @click="addProduct($parent)">確認修改</button>
                </div>

            </span>
        </el-form>
    </el-dialog>
</div>

</template>

<script lang="ts" setup>
import { ref, reactive, computed } from 'vue'
import { useOrderPageStore } from '@/stores/orderPage';
import { storeToRefs } from 'pinia'
import { ElMessage } from 'element-plus';

const orderPageStore = useOrderPageStore()
const { dialogFormVisible2, customizeList, productData,businessUser,cartList } = storeToRefs(orderPageStore)




//回填資料
function backfill(){
    data.businessUserId = businessUser.value.id
    data.categoryId = productData.value.categoryId
    data.extraPrice = productData.value.extraPrice
    data.price = productData.value.productPrice
    data.image = productData.value.image
    data.productName = productData.value.productName
    data.productId = productData.value.productId
    const cart = cartList.value[productData.value.indexForUpdate]
    const customData = cart.customizes
    const copyCustomData = JSON.parse(JSON.stringify(customData))
    

    
    
    data.op0 = copyCustomData[0].split(':')[2]
    data.op1 = copyCustomData[1].split(':')[2]
    
    for(let i = 2 ; i<copyCustomData.length;i++){
        data.op4.push(copyCustomData[i].split(':')[2])
    }
    num.value = cart.amount
    data.customizes = copyCustomData

    
}


//個數
const num = ref(1)
const handleChange = (value: number) => {
    num.value = value
}

const totalPrice = computed(() => num.value * (productData.value.productPrice + data.extraPrice))
//點選單選框
function customizeOption(customId: number, optionId: number, customizeName: string, custOptionName: string, extraPrice: number, index: number) {
    
    const radioOptions = `${customId}:${custOptionName}:${optionId}`
    const i = data.customizes.indexOf(radioOptions)

    
    //判斷是否要取消選中
    if(index !=2){
        if (isChecked(optionId, index, extraPrice)) {
            
            data.customizes.splice(i, 1)
            return
        }

    }

    //判斷是否重複
    if (i == -1) {

        //更改選項時去除原本相同category數據
        if(index != 2){
            handleCustomizes(customId)
        }

        data.customizes.push(radioOptions)

        data.productId = productData.value.productId
        data.categoryId = productData.value.categoryId
        data.productName = productData.value.productName
        data.price = productData.value.productPrice

        data.extraPrice += extraPrice


        data.businessUserId = businessUser.value.id
        data.image = productData.value.image

    


    }else{
        data.extraPrice -= extraPrice
        data.customizes.splice(i, 1)
        
    }



}


function isChecked(optionId: number, index: number, extraPrice: number): boolean {
    switch (index) {
        case 0:
            if (optionId == data.op0) {
                data.op0 = 0
                data.extraPrice -= extraPrice
                return true;
            } else {
                data.op0 = optionId
                return false
            }
        case 1:
            if (optionId == data.op1) {
                data.op1 = 0
                data.extraPrice -= extraPrice

                return true;
            } else {
                data.op1 = optionId
                return false
            }
        // case 2:
        //     if (optionId === data.op2) {
        //         data.op2 = 0
        //         data.extraPrice -= extraPrice
        //         return true;
        //     } else {
        //         data.op2 = optionId
        //         return false
        //     }
        case 3:
            if (optionId == data.op3) {
                data.op3 = 0
                data.extraPrice -= extraPrice
                return true;
            } else {
                data.op3 = optionId
                return false
            }

    }

    return
}

const data = reactive({
    productId: 0,
    categoryId: 0,
    customizes: [],
    num: num,
    price: 0,
    productName: '',
    extraPrice: 0,
    image:'',
    

    businessUserId:0,


    op0: 0,
    op1: 0,
    op2: 0,
    op3: 0,
    op4: []
})

function addProduct(parent) {
    
    //驗證選項
    if(validateCustomizes()){
        ElMessage({
            message:'請選擇溫度或甜度',
            type:'error',
            offset:40,
        })
        return
    }


    orderPageStore.$patch((state: any) => {
        //關閉視窗
        state.dialogFormVisible2 = false

        //資料傳入cart
        state.cart.productId = data.productId
        state.cart.productName = data.productName
        state.cart.productPrice = data.price
        state.cart.extraPrice = data.extraPrice
        state.cart.amount = data.num
        state.cart.customizes = data.customizes.sort()
        state.cart.totalPrice = totalPrice
        state.cart.category = data.categoryId
        state.cart.image = data.image



        

        state.cart.businessUserId = data.businessUserId

    })

    parent.selectCoupon = -1
    parent.flag1=false
    parent.flag2=false

    orderPageStore.spliceCartList(productData.value.indexForUpdate)
    clearData()
    setTimeout(() => {
        orderPageStore.count++
    }, 100);


}
function validateCustomizes():boolean{

    return data.op0 == 0 || data.op1 ==0 ? true : false
}

function clearData() {

    //清空資料
    data.customizes = []
    data.op0 = 0
    data.op1 = 0
    data.op2 = 0
    data.op3 = 0
    data.op4.splice(0)
    data.num = 1
    data.productId = 0
    data.categoryId = 0
    data.productName = ''
    data.extraPrice = 0
    
    
    data.image=''
    data.businessUserId=0


}

function handleCustomizes(customId: number) {
    data.customizes.forEach((element: string) => {
        const tempStr = element.split(':')[0]
        if (tempStr === customId.toString()) {
            const index = data.customizes.indexOf(element)
            data.customizes.splice(index, 1)
            return
        }
    });
}









</script>
<style scoped>
.alert.alert-danger{
    margin-top: 30px;
}
.btn-primary {

    color: var(--bs-btn-active-color);
    background-color: #ff5e7d;
    border-color: #ff5e7d;
}

.footer-price {
    margin: 10px 0 10px 25px;
    text-align: left;
}

.dialog-footer {
    display: flex;
    justify-content: space-between;
    border-top: 1px solid rgba(68, 68, 68, 0.1);

}

.btn:not(.btn-submit):hover{
    border-color: #ff5e7d;
    color:#ff5e7d;
} 

.btn-check:checked+.btn,
.btn.active,
.btn.show,
.btn:first-child:active,
:not(.btn-check)+.btn:active{
    color: var(--bs-btn-active-color);
    background-color: #ff5e7d;
    border-color: #ff5e7d;
}

.btn-outline-primary {
    border: 1px solid #ff5e7d;
    color: #ff5e7d;
}


.btn {
    width: 110px;
    margin: 5px 5px 0 5px;
}

.btn-submit {
    margin: 20px 20px 0 0;
    width: 150px;
    height: 50px;
}
.meanness :deep(.el-dialog__title){
    color: #fa4438;
    font-size: 24px;
    padding: 8px 16px;
    font-weight: 900;
}


.formItem:deep(.el-form-item__label) {
    font-weight: 700;
    font-size: large;
    padding-left: 20px;
}
</style>
