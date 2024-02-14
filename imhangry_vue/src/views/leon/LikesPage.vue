<template>
    <div class="row row-cols-1 row-cols-md-3 g-4" style="margin-top:10px ; ">
        <div v-if="likeExist" style="text-align: center; width: 100%;">
            <div><font-awesome-icon :icon="['fas', 'question']" size="2xl" /></div>
            <div>
                <p style="font-size: 32px; font-family: 'Honk', system-ui; ">查無資料</p>
            </div>
        </div>
        <div class="col" v-for="{ address, businessUserName, icon, id, rate, openTime } in likesDetail.list" v-else>
            <div class="card h-100" style="border: none; text-align: center;" @click="toOrderPage(id)">

                <img src="../../../orderPageImage/Hangry.jpg" class="card-img" alt=" " style="width: 100%; margin: auto;">
                <LikeComponent style="position: absolute; top: 0; right: 0;" class="fonticon" :fk_business_id="id">
                </LikeComponent>
                <div class="card-body">
                    <!-- <h5 class="card-title">{{spotId}} {{ spotTitle }}</h5> -->

                    <p class="card-text" style="text-align: center;"><a>{{ businessUserName }}</a></p>

                    <div class="spdiv">
                        <span class="spaninfo">{{ openTime }}</span>
                        <span class="spaninfo">約 {{ id * 0.85 }} km</span>
                        <span class="spaninfo"><font-awesome-icon :icon="['fas', 'star']" style="color: #FFD43B;" /> {{
                            rate }}</span>
                    </div>
                    <p>{{ address }}</p>
                </div>



            </div>
        </div>
    </div>
</template>
    
<script setup>
import axios from 'axios';
import { ref, reactive, onMounted } from 'vue'
import { get } from 'vue-cookies'
import { useRouter } from 'vue-router';
import LikeComponent from '@/components/leon/LikeComponent.vue';
const likesDetail = reactive({});
const cookieData = ref();
const guestUserId = ref();
const likeExist = ref(true);


const route = useRouter();

function toOrderPage(id) {
    route.push({ name: 'OrderPage', params: { id: id } })
}
async function allLikes() {
    const response = await axios.get(`http://localhost:8080/likesPage/${guestUserId.value}`)
    Object.assign(likesDetail, response.data)
    console.log(likesDetail.list.length)
    if (likesDetail.list.length > 0)
        likeExist.value = false;
}


function getcookie() {
    cookieData.value = get('userData')
    console.log(cookieData.value)
    cookieData.value = window.atob(cookieData.value)
    console.log(cookieData.value)
    guestUserId.value = JSON.parse(cookieData.value).id
    console.log(guestUserId.value);
}

getcookie();
allLikes();









</script >
    
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Honk&display=swap');

.spdiv {
    display: flex;
    justify-content: center;
}



.spaninfo {
    width: 32%;
    text-align: center;
    background-color: rgb(231, 231, 231);
    border-radius: 5px 5px;
    margin: 3px;
    height: 30px;
    padding-top: 3px;
    padding-bottom: 2px;

}
</style>