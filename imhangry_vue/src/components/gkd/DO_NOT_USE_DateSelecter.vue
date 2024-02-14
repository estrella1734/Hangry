<template>
    <div id="select">
        <table>
            <tr>
                <td>請選擇要查詢的日期區間 : </td>
                <td><flat-pickr v-model="findMakeStart" v-bind:config="flatpickrConfig" v-on:change="findMakeStartChange" />
                </td>
                <td> -> </td>
                <td><flat-pickr v-model="findMakeEnd" v-bind:config="flatpickrConfig" v-on:change="findMakeEndChange" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="查詢" v-on:click="callFind()">
                </td>
            </tr>
        </table>
    </div>
</template>
    


<script setup>
import 'flatpickr/dist/flatpickr.css';
import { ref } from 'vue';
import flatPickr from 'vue-flatpickr-component';

const flatpickrConfig = ref({
    "enableTime": true,
    dateFormat: "Y-m-d",
    findMakeStart: null,
    findMakeEnd: null,
})
//v-on:change="findMakeStartChange"->代表當有數值改變時，會執行把數值放入findMakeStart

const findMakeStartChange = function findMakeStartChange(date) {
    flatpickrConfig.value.findMakeStart = date.target.value;
    console.log(flatpickrConfig.value.findMakeStart);

    //開始日期在結束日期後
    if (flatpickrConfig.value.findMakeStart !== null && flatpickrConfig.value.findMakeStart > flatpickrConfig.value.findMakeEnd) {
        flatpickrConfig.value.findMakeEnd = flatpickrConfig.value.findMakeStart;
        console.log(flatpickrConfig.value.findMakeEnd);
        console.log("狀況一");
    }
}

const findMakeEndChange = function findMakeEndChange(date) {
    flatpickrConfig.value.findMakeEnd = date.target.value
    console.log(flatpickrConfig.value.findMakeEnd);
    if (flatpickrConfig.value.findMakeEnd !== null && flatpickrConfig.value.findMakeStart > flatpickrConfig.value.findMakeEnd) {
        flatpickrConfig.value.findMakeEnd = flatpickrConfig.value.findMakeStart;
        console.log(flatpickrConfig.value.findMakeEnd);
        console.log("狀況二");
    }
}



</script>
    


<style scoped></style>