import { defineStore } from 'pinia';
import { ref } from 'vue';


export const useDateInfo = defineStore('dateInfo',()=>{
    const startDate = ref(new Date(new Date().setDate(new Date().getDate() - 6)));
    const endDate = ref(new Date())

    return{
        startDate,endDate
    }
});

// export const useDateInfo = defineStore('dateInfo', {
//     //定義狀態初始值
//     state: () => {
//         return {
//             startDate: new Date(),
//             endDate: new Date(new Date().setDate(new Date().getDate() - 6))
//         }
//     },
//     //定義使用到的函式，可以為同步和非同步，如同 method
//     actions: {
//         getDate() {

//         },
//     },
// })