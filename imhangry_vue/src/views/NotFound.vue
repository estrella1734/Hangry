<template>
    <h1>test</h1>

    <body class="notFound"></body>
</template>
<script setup>
import { getCookieData } from '@/components/sean/util/Gettes'


const userData = getCookieData('userData');
console.log(userData)
const id = userData?.id;
console.log('id', id)
</script>

<style scoped>
.notFound {
    /* 使用相對路徑引用背景圖片 */
    background-image: url('/404.png');
}
</style>