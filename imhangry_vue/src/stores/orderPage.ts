//@ts-nocheck
import { defineStore } from "pinia";
import {get} from 'vue-cookies'



import { reactive, ref } from "vue";
import axios from "axios";

export const useOrderPageStore = defineStore('orderPage',()=>{


    //獲取Business資料
    async function getBusinessUser(businessUserId:number = 1) {
            try {
                const {data} = await axios.get(`${import.meta.env.VITE_API_BASE}/orderPage/${businessUserId}`)
                Object.assign(businessUser,data)
            } catch (error) {
                console.log(error);
            
            }
    }

    const businessUser =reactive({
        id:0,
        name:'',  
        brandName:'',
        time:'',
        phone:'',
        city:'',
        dist:'',
        address:'',
        rate:4.9,
        rateCount:200
    })


    //獲取Product資料
    async function getProducts(businessUserId:number = 1){
        try {
            const {data} = await axios.get(`${import.meta.env.VITE_API_BASE}/orderPage/products/${businessUserId}`)
            Object.assign(productList,data)
            
            
            
        } catch (error) {
            console.log(error);
            
        }

    }
    const productList = reactive([
    
    
    

    ])
    


    //獲取Product的customize資料
    async function getCustomize(categoryId:number) {
        try {
            const {data} = await axios.get(`${import.meta.env.VITE_API_BASE}/orderPage/customizations/${categoryId}`)
            customizeList.length = 0
            Object.assign(customizeList,data)
            
            
        } catch (error) {
            console.log(error)
        }
    }
    const customizeList = reactive(
        [
            {
                id:0,
                customizeName:'',
                customizeOption:[

                ]
            },

        ]
        
    )

    //表單顯示開關
    const dialogFormVisible = ref(false)
    const dialogFormVisible2 = ref(false)
    //購物車按鈕開關
    const showCartBtn = ref(false)

    //強迫刷新
    const count = ref(0)

    function checkCartList(){
        showCartBtn.value = localStorage.getItem('cartList') !=="[]" ?  true :false
    }

    //產品資訊儲存
    const productData = reactive({
        productId:0,
        categoryId:0,
        productPrice:0,
        productName:'',
        categoryName:'',
        image:'',

        indexForUpdate:0,
        extraPrice:0
    })

    const cart= reactive({
        productName:'',
        customizes:[],
        productPrice:0,
        amount:0,
        businessUserId:0,
        productId:0,
        userId:0,

        extraPrice:0,
        category:0,
        image:''
    })

    function addCartList(){
        let obj = JSON.parse(JSON.stringify(cart)) 
        if(validateCartList(obj)){
            cartList.push(obj)
        }
    }


    function validateCartList(obj:Array):boolean{
        if(localStorage.getItem('cartList') ==="[]"){
            return true
        }else{
            const tempArr = JSON.parse(localStorage.getItem('cartList'))
            return !isInclude(obj,tempArr)
        }
            
        
    }
    function isInclude(obj:Object,arr:Array):boolean{
        for (let i = 0; i < arr.length; i++) {
            if(arr[i].productName === obj.productName && arr[i].productPrice === obj.productPrice){
                if(arr[i].customizes.toString() === obj.customizes.toString()){
                    cartList[i].amount += obj.amount
                    cartList[i].totalPrice += obj.totalPrice
                    return true;
                }
            }
        
        }
        return false
    }
        
    const cartList = reactive(
        (localStorage.getItem('cartList')) != null  ? JSON.parse(localStorage.getItem('cartList')) :[] 
    )


    async function getAddressList(userId:number = 1) {
        try {
            const {data} = await axios.get(`${import.meta.env.VITE_API_BASE}/orderPage/cart/${userId}`)
            for(let i = 0;i<data.length;i++){
                data[i].index=i
            }
            
            Object.assign(addressList,data)
        } catch (error) {
            console.log(error);
        }
    
    }

    const addressList=reactive([])

    function spliceCartList(index:number){
        let obj = JSON.parse(JSON.stringify(cart))
        cartList.splice(index,1,obj) 
    }

    async function getCouponList(userId:number = 1) {
        try {
            const {data} = await axios.get(`${import.meta.env.VITE_API_BASE}/orderPage/coupon/${userId}`)
            
            Object.assign(couponList,data)
        } catch (error) {
            console.log(error);
        }
    }
    const couponList = reactive([])


    const guestUserId = ref()
    const cookieData = ref();
    //登入驗證
    function getcookie() {
        cookieData.value = get('userData')
        // console.log(cookieData.value)
        if (cookieData.value == null) {

            
        return false
          // 
        } else {
      
        cookieData.value = window.atob(cookieData.value)
        guestUserId.value = JSON.parse(cookieData.value).id
            return true
        }
      }

    return {
        businessUser,productList,dialogFormVisible
        ,customizeList,productData,getBusinessUser
        ,getProducts,getCustomize,cart,addCartList
        ,cartList,showCartBtn,checkCartList,count
        ,getAddressList,addressList,dialogFormVisible2
        ,spliceCartList,getCouponList,couponList
        ,getcookie,guestUserId
    }


    

})