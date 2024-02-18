<template>
    <div class="div-bg">
        <div class="text-center">
            <div class="div--col">

                <el-autocomplete v-model="state" :fetch-suggestions="querySearchBrand" popper-class="my-autocomplete"
                    placeholder="" @select="handleBrandSelect">
                    <template #prepend>品牌:</template>
                    <template #suffix>
                        <el-icon class="el-input__icon" @click="handleIconClick"><font-awesome-icon
                                :icon="['fas', 'magnifying-glass']" />
                            <edit />
                        </el-icon>
                    </template>
                    <template #default="{ item }">
                        <div class="value">{{ item.Value }}</div>
                        <!-- <span class="link">{{ item.link }}</span> -->
                    </template>
                </el-autocomplete>
            </div>
            <div class="div--col">

                <el-autocomplete v-model="state1" :fetch-suggestions="querySearchType" popper-class="my-autocomplete1"
                    placeholder="" @select="handleTypeSelect">
                    <template #prepend>餐點種類:</template>
                    <template #suffix>
                        <el-icon class="el-input__icon" @click="handleIconClick"><font-awesome-icon
                                :icon="['fas', 'magnifying-glass']" />
                            <edit />
                        </el-icon>
                    </template>
                    <template #default="{ item }">
                        <div class="value">{{ item.Value }}</div>
                        <!-- <span class="link">{{ item.link }}</span> -->
                    </template>
                </el-autocomplete>
            </div>
        </div>
    </div>
</template>
    
<script setup lang='ts'>
import { Edit } from '@element-plus/icons-vue';
import axios from 'axios';
import { onMounted, reactive, ref } from 'vue';




interface brandItem {
    Value: string
}
interface typeItem {
    Value: string
}



const state = ref('')
const state1 = ref('')
let brand = reactive<brandItem[]>([])
let type = reactive<typeItem[]>([])
const searchResult = reactive({})

const querySearchBrand = (queryString: string, cb) => {
    const results = queryString
        ? brand.filter(createFilter(queryString))
        : brand
    // call callback function to return suggestion objects
    cb(results)
}

const querySearchType = (queryString: string, cb) => {
    const results = queryString
        ? type.filter(createFilter(queryString))
        : type
    // call callback function to return suggestion objects
    cb(results)
}

const createFilter = (queryString) => {
    return (restaurant) => {
        console.log(restaurant)
        return (
            restaurant.Value.toLowerCase().indexOf(queryString.toLowerCase()) >= 0
        )
    }
}
const loadAllBrand = async () => {
    const response = await axios.get(`${import.meta.env.VITE_API_BASE}/findBusinessBrand`)
    return response.data.list
}
const loadAllType = async () => {
    const response = await axios.get(`${import.meta.env.VITE_API_BASE}/findBusinessType`)
    return response.data.list


}
const emit = defineEmits(["updateEvent"])


const handleBrandSelect = async (item: brandItem) => {
    const response = await axios.get(`${import.meta.env.VITE_API_BASE}/SearchBrand/` + item.Value)
    Object.assign(searchResult, response.data)
    const returnResult = () => {
        emit("updateEvent", searchResult)
    }
    returnResult();
}
const handleTypeSelect = async (item: typeItem) => {
    const response = await axios.get(`${import.meta.env.VITE_API_BASE}/SearchType/` + item.Value)
    Object.assign(searchResult, response.data)
    const returnResult = () => {
        emit("updateEvent", searchResult)
    }

    returnResult();
    // console.log(searchResult)
}




const handleIconClick = (ev: Event) => {
    console.log(ev)
}

onMounted(async () => {
    brand = await loadAllBrand();
    type = await loadAllType();
    console.log(brand)
    console.log(type)

})


</script>

























































<style scoped>
.div--col :deep(.el-input__wrapper) {
    border: none;
    outline: none;
}

.div-bg {
    background-color: rgb(196, 196, 196);
    padding: 16px 16px;
    text-align: center;
    position: relative;
    line-height: 25px;
    display: block;
}

.text-center {
    text-align: center;
    display: flex;
    line-height: 25px;
    flex-wrap: wrap;
}

.div--col {
    position: relative;
    height: auto;
    width: 50%;

}

.div--col input {
    width: 100%;
    height: 40px;
    border: none;
    outline: none;
}

.div--col button {
    background-color: white;
    position: absolute;
    width: 10%;
    height: 40px;
    right: 0;
    border: none;
    outline: none;
}
</style>