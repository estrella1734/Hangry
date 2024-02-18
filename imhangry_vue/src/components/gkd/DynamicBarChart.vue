<template>
    <div class="TopCard">

        <div class="todayInfo">
            <Today class="Today"></Today>
        </div>

        <div class="vCalendar">
            <date-selecter-v-calendar @startFromDSVC="handleStartChange"
                @endFromDSVC="handleEndChange"></date-selecter-v-calendar>
        </div>

    </div>

    <div class="SecondCard">

        <span class="pieChart">
            <PieChart></PieChart>
        </span>

        <span class="lineChart">
            <Bar class="Bar" id="my-chart-id" :options="chartOptions" :data="chartData" />
        </span>

    </div>

    <div class="ThirdCard">

        <span class="orderDetailCard">
            <product-quick-view></product-quick-view>
        </span>

        <span class="businessReport">
            <business-report></business-report>
        </span>

    </div>
</template>


<script>

//import套件
import axios from 'axios';
import { BarElement, CategoryScale, Chart as ChartJS, Legend, LinearScale, Title, Tooltip } from 'chart.js';
import { Bar } from 'vue-chartjs';
import DateSelecterVCalendar from './DateSelecterVCalendar.vue';

//import子元件
import BusinessReport from './BusinessReport.vue';
import PieChart from './PieChart.vue';
import ProductQuickView from './ProductQuickView.vue';
import Today from './TodayInfo.vue';


//chartjs註冊
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)





const formatDate = (date) => {
    let day = date.getDate().toString();
    let month = (date.getMonth() + 1).toString(); // 加 1 因為月份是從 0 開始
    const year = date.getFullYear().toString();

    // 確保月和日都是兩位數
    day = day.length < 2 ? '0' + day : day;
    month = month.length < 2 ? '0' + month : month;

    return `${year}-${month}-${day}`;
};


//初始化資料，當周營業額
//定義日期區間為現在~七天前
const currentTimeSeven = formatDate(new Date(new Date().setDate(new Date().getDate() - 5)));//start 01-20
const currentTime = formatDate(new Date(new Date().setDate(new Date().getDate() + 1)));//end 01-26

//初始化資料，前周營業額
//定義日期區間為七天前~十四天前
const weeksAgoStart = formatDate(new Date(new Date().setDate(new Date().getDate() - 11)));//start 01-13
const weeksAgoEnd = formatDate(new Date(new Date().setDate(new Date().getDate() - 5)));//end 01-20


export default {

    name: 'app',

    components: { Bar, Date, DateSelecterVCalendar, Today, ProductQuickView, PieChart, BusinessReport },

    data: function () {

        return {
            chartData: {
                //初始化chartData的內容
                labels: [],
                datasets: [],
            },

            chartOptions: {
                responsive: true,
                tooltips: {
                    enabled: true,
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        label: function (tooltipItem, data) {
                            let label = data.datasets[tooltipItem.datasetIndex].label || '';
                            if (label) {
                                label += ': ';
                            }
                            label += tooltipItem.yLabel;
                            return label;
                        },
                        title: function (tooltipItem, data) {
                            // 假設第二個數據集是前週的數據
                            if (tooltipItem[0].datasetIndex === 1) {
                                // 返回前週的日期
                                return dateArrayWeeksAgo[tooltipItem[0].index];
                            } else {
                                // 返回當前的日期
                                return dateArray[tooltipItem[0].index];
                            }
                        }
                    }
                }
            },

            //這裡是要送進去chart內的參數，轉成字串，兩根圖表需要四個參數
            //共兩組開始結束日

            //第一組，為選擇的日期區間
            fromDSVCStartDate: currentTimeSeven,
            fromDSVCEndDate: currentTime,

            //第二組，為第一組日期區間各減去七天
            fromDSVCWeeksAgoStartDate: weeksAgoStart,
            fromDSVCWeeksAgoEndDate: weeksAgoEnd
        }
    },
    methods: {

        formatDate(date) {
            let day = date.getDate().toString();
            let month = (date.getMonth() + 1).toString(); // 加 1 因為月份是從 0 開始
            const year = date.getFullYear().toString();

            // 確保月和日都是兩位數
            day = day.length < 2 ? '0' + day : day;
            month = month.length < 2 ? '0' + month : month;

            return `${year}-${month}-${day}`;
        },

        //處理傳遞進來的日期
        handleStartChange(newStartDate) {

            const formatStartDate = this.formatDate(newStartDate)
            this.fromDSVCStartDate = formatStartDate; // 更新儲存的開始日
            // console.log('格式化後新的開始日期:', formatStartDate);

            // 動態處理將傳入的時間減去七天
            const newStartDateMinus = new Date(newStartDate);
            newStartDateMinus.setDate(newStartDateMinus.getDate() - 6);

            // 輸出格式化後的日期
            const formatDate = this.formatDate(newStartDateMinus)
            this.fromDSVCWeeksAgoStartDate = formatDate;
        },

        //處理傳遞進來的日期
        handleEndChange(newEndDate) {

            const formatEndDate = this.formatDate(newEndDate)
            this.fromDSVCEndDate = formatEndDate; // 更新儲存的結束日
            // console.log('格式化後新的結束日期:', formatEndDate);

            // 動態處理將傳入的時間減去七天
            const newStartDateMinus = new Date(newEndDate);
            newStartDateMinus.setDate(newStartDateMinus.getDate() - 6);

            // 輸出格式化後的日期
            const formatDate = this.formatDate(newStartDateMinus)
            this.fromDSVCWeeksAgoEndDate = formatDate;
        },

        subStringForDisplay(fullDate) {
            return fullDate.substring(0, 10)
        },

        async fetchData() {

            // console.log(currentTimeFourteen);
            try {
                //這裡要動態接到DSVC變化的fromDSVCStartDate、fromDSVCEndDate
                //設立檢查機制，假如日期有更新要重新渲染
                const currentRequestBody = {
                    startDate: this.fromDSVCStartDate,
                    endDate: this.fromDSVCEndDate
                };
                const responseCurrent = await axios.post(
                    `${import.meta.env.VITE_API_BASE}/pages/rest/revenue/findByDates`,
                    currentRequestBody
                );
                const currentData = responseCurrent.data;

                //for loop 抓出data的資料，抓出item.id，item.revenue
                const idArray = [];
                const revenueArray = [];
                const dateArray = [];


                currentData.forEach(item => {
                    idArray.push(item.id)
                    revenueArray.push(item.revenue)
                    dateArray.push(this.subStringForDisplay(item.date))
                });

                //處理第二條資料
                const requestBodyWeeksAgo = {
                    startDate: this.fromDSVCWeeksAgoStartDate,
                    endDate: this.fromDSVCWeeksAgoEndDate
                };
                const responseWeeksAgo = await axios.post(
                    `${import.meta.env.VITE_API_BASE}/pages/rest/revenue/findByDates`,
                    requestBodyWeeksAgo
                );
                const dataWeeksAgo = responseWeeksAgo.data;

                //for loop 抓出data的資料，抓出item.id，item.revenue
                const idArrayWeeksAgo = [];
                const revenueArrayWeeksAgo = [];
                const dateArrayWeeksAgo = [];

                dataWeeksAgo.forEach(item => {
                    idArrayWeeksAgo.push(item.id)
                    revenueArrayWeeksAgo.push(item.revenue)
                    dateArrayWeeksAgo.push(this.subStringForDisplay(item.date))
                });


                // 更新 chartData
                this.chartData = {
                    labels: dateArray, // 假設 dateArray 包含所有需要顯示的日期
                    datasets: [
                        {
                            label: "前週營業額",
                            backgroundColor: "#F9BF29",
                            data: revenueArrayWeeksAgo
                        },
                        {
                            label: "當日營業額",
                            backgroundColor: "#33808B",
                            data: revenueArray
                        },
                    ]
                };

            } catch (error) {
                console.error("Error fetching data:", error);
            }
        },
    },

    //建立起API傳回JSON的資料變數
    //2024/01/09 15:01 ASYNC 解釋
    async created() {
        this.fetchData();
    },
    // watch(range, updateDateRange);
    watch: {
        fromDSVCStartDate(newVal, oldVal) {
            if (newVal !== oldVal) {
                this.fetchData();
            }
        },
        fromDSVCEndDate(newVal, oldVal) {
            if (newVal !== oldVal) {
                this.fetchData();
            }
        }
    },
}
</script>

<style scoped>
* {
    padding: 0;
    margin: 0;
}

.TopCard {
    width: auto;
    height: 410px;
    min-height: 400px;
    margin: 50px auto
}

.todayInfo {
    width: auto;
    min-height: 400px;
    float: left;
}

.vCalendar {
    width: 38%;
    min-height: 400px;
    float: right;
}

.SecondCard {
    width: auto;
    min-height: 385px;
    margin: 50px auto
}

.pieChart {
    background-color: #fff;
    width: 500px;
    height: 385px;
    border-radius: 2rem;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
    float: left;
}

.lineChart {
    width: 768px;
    height: 385px;
    padding: 8px;
    background-color: rgb(255, 255, 255);
    display: flex;
    /* flex-direction: column; */
    border-radius: 2rem;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
    float: right;
}


.ThirdCard {
    width: auto;
    min-height: 385px;
    margin: 50px auto
}

.orderDetailCard {
    width: 768px;
    height: 385px;
    border-radius: 2rem;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
    float: left;
}

.businessReport {
    border-radius: 2rem;
    width: 500px;
    height: 385px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
    float: right;
}
</style>