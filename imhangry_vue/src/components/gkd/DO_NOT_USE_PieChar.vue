<template>
        <Doughnut :data="chartData" :options="chartOptions" />
</template>
    
<script>
import axios from 'axios'
import { ArcElement, Chart as ChartJS, Legend, Tooltip } from 'chart.js'
import { Doughnut } from 'vue-chartjs'

ChartJS.register(ArcElement, Tooltip, Legend)

export default {
    name: 'app',
    components: { Doughnut },

    data() {
        return {
            chartData: {
                labels: ['ecPay', 'cash', 'cashOnDelivery', 'creditCard'],
                datasets: [
                    {
                        backgroundColor: ['#33808B', '#F9BF29', '#DEDED6', '#435C51'],
                        data: [1,2,3,4]
                    }
                ],
            },
            chartOptions: {
                responsive: true,
                maintainAspectRatio: false
            },
            ecPay: 0,
            cash: 0,
            cashOnDelivery: 0,
            creditCard:0,
            other:0,
            data:[],

        }
    },
    methods:{
        async fetchData(){

            const buId = 1;

            const response = await axios.get("http://localhost:8080/pages/rest/orderform/findPieChart/1")

            response.data.forEach(element => {

                if(element==='ec pay'){
                    this.ecPay++
                }
                else if(element==='cash'){
                    this.cash++
                }
                else if(element==='cash on delivery')
                    this.cashOnDelivery++
                else if(element==='credit card'){
                    this.creditCard++
                }
                else{
                    this.other++
                    console.log('other'+element);
                }
            });
            // console.log('ec->'+this.ecPay);
            // console.log('cash->'+this.cash);
            // console.log('cod->'+this.cashOnDelivery);
            // console.log('criCard->'+this.creditCard);
            // console.log('other->'+this.other);
            this.data.push(this.ecPay)
            this.data.push(this.cash)
            this.data.push(this.cashOnDelivery)
            this.data.push(this.creditCard)
            console.log(this.data);

        }

    },

    async created() {
        this.fetchData();
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