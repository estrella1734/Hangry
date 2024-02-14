<template>
    <div>
        <h1>test</h1>
        <p>{{ dateInfo.startDate }}</p>
        <p>{{ dateInfo.endDate }}</p>
        <button @click="changeDate">改時間</button>
    </div>
</template>

<script setup lang="ts">
import { useDateInfo } from '@/stores/dateInfo';

const dateInfo = useDateInfo();

function changeDate() {
    dateInfo.startDate = new Date('2023-01-22').toISOString();
    dateInfo.endDate = new Date('2023-01-23').toISOString();
}
</script>
