<template>
    <Doughnut :data="chartData" :options="chartOptions" />
</template>
    
<script>
import { useDateInfo } from '@/stores/dateInfo';
import axios from 'axios';
import { ArcElement, Chart as ChartJS, Legend, Tooltip } from 'chart.js';
import { computed } from 'vue';
import { Doughnut } from 'vue-chartjs';

ChartJS.register(ArcElement, Tooltip, Legend)

export default {
    name: 'app',

    components: { Doughnut },

    setup() {
        const dateInfo = useDateInfo();
        const localStartDate = computed(() => dateInfo.startDate);
        const localEndDate = computed(() => dateInfo.endDate);
        return {
            dateInfo: dateInfo,
            localStartDate: localStartDate,
            localEndDate: localEndDate,
        }
    },

    data() {
        return {
            chartData: {
                labels: ['ecPay', 'cash', 'cashOnDelivery', 'creditCard'],
                datasets: [
                    {
                        backgroundColor: ['#33808B', '#F9BF29', '#DEDED6', '#435C51'],
                        data: [1, 2, 3, 4]
                    }
                ],
            },
            chartOptions: {
                responsive: true,
                maintainAspectRatio: false
            },

            paymentType: [],
            paymentTypeCount: {},
        }
    },

    async created() {
        this.fetchData();
    },

    methods: {
        async fetchData() {

            //拿出使用者資料
            const userString = sessionStorage.getItem('userInfo');
            const user = JSON.parse(userString);
            const buId = user.id;

            const requestBody = {
                buId: buId,
                startDate: this.localStartDate,
                endDate: this.localEndDate
            }

            const response = await axios.post("http://localhost:8080/pages/rest/orderform/findPaymentTypeByDate", requestBody)

            //拿回['cash', 'cash', 'ec pay', 'cash on delivery', 'credit card']格式的資料
            // console.log(response.data);

            //將付款種類轉成['cash', 'ec pay', 'cash on delivery', 'credit card']這樣的格式，內容只有三種就只能有三個
            const paymentType = response.data;

            //剔除重複的陣列內容，每種元素只顯示一次
            const uniquePaymentType = [...new Set(paymentType)]

            // console.log('uniquePaymentType->', uniquePaymentType);

            //將資料轉成['x','x','x','x']的格式，且上面只出現三種，這裡也只能出現三個數值
            response.data.forEach(element => {
                if (this.paymentTypeCount[element]) {
                    this.paymentTypeCount[element] += 1;
                } else {
                    this.paymentTypeCount[element] = 1;
                }
            });
            const countArray = Object.values(this.paymentTypeCount);

            this.chartData = {
                labels: uniquePaymentType,
                datasets: [
                    {
                        label: "付款筆數",
                        backgroundColor: ['#33808B', '#F9BF29', '#DEDED6', '#435C51'],
                        data: countArray
                    }
                ]
            };
        }
    },

    watch: {
        localStartDate(newVal, oldVal) {
            if (newVal !== oldVal) {
                this.fetchData();
            }
        },
        localEndDate(newVal, oldVal) {
            if (newVal !== oldVal) {
                this.fetchData();
            }
        },
    },
}
</script>
    
<style scoped>
body {
    border-radius: 10px;
    width: 500px;
    height: 385px;
    max-height: 385px;
}
</style>