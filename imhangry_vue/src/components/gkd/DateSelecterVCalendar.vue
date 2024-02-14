<template>
    <div class="container">
        <!-- 刪除下方expanded可以縮小日曆 -->
        <DatePicker expanded v-model.range="range" mode="dateTime" :color="selectedColor" />
    </div>
</template>


<script setup>
import { useDateInfo } from '@/stores/dateInfo';
import { DatePicker } from 'v-calendar';
import 'v-calendar/dist/style.css';
import { ref, watch } from 'vue';



//定義兩個emit要傳到DBC的startDate、endDate
const emit = defineEmits(['startFromDSVC', 'endFromDSVC']);

//設定顏色
const selectedColor = ref('yellow');

//從pinia中取出時間
const dateInfo = useDateInfo();

//pinia提供日期區間
const range = ref({
    start: dateInfo.startDate,
    end: dateInfo.endDate,
});

//使用者在calendar選擇日期，會讓range內的range.value.start、end產生變化
//當資料有變化時，start與end要傳出新的日期參數->
const updateDateRange = () => {
    emit('startFromDSVC', range.value.start)
    emit('endFromDSVC', range.value.end)
};

//v-calendar被使用者更改日期後會將參數傳至pinia->
const updateDateToPinia = () => {
    dateInfo.startDate = range.value.start
    dateInfo.endDate = range.value.end
}

// 監聽range的變化，當有變化時執行updateDateRange把參數傳給chart父元件
watch(range, updateDateRange);

// 監聽range的變化，當有變化時執行updateDateRange把參數傳給pinia
watch(range, updateDateToPinia);

</script>


<style scoped>
.container {
    border-radius: 2rem;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
}


</style>