<template>
        <h1>DEMO</h1>
</template>
    
<script setup>
//如何讓父元件component引用這個子元件？

//1. defineProps一個name屬性在本子元件的script
defineProps(['names'])

//2.在父元件script內import這個子元件
// import Demo from '子元件的路徑'

//3.在父元件下方component加上定義的屬性名
// components: { Demo } ->option寫法（script內沒有setup）
// composition: 不用撰寫，在template內可以直接以元件名稱引用


</script>
    
<style>
    
</style>