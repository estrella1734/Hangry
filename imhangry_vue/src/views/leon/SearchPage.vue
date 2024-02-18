<template>
    <SearchComponent @updateEvent="updateEvent"></SearchComponent>

    <div class="row row-cols-1 row-cols-md-3 g-4 mouse" style="margin-top:10px ; ">
        <div class="col" v-for="{ address, businessUserName, icon, id, rate, openTime, index } in searchResult">

            <div class="card h-100" style="border: none; text-align: center;" @click="toOrderPage(id)">

                <img src="/orderPageImage/Hangry.jpg" class="card-img" alt=" " style="width: 100%; margin: auto;">
                <LikeComponent style="position: absolute; top: 0; right: 0;" class="fonticon" :fk_business_id="id">
                </LikeComponent>
                <div class="card-body">
                    <!-- <h5 class="card-title">{{spotId}} {{ spotTitle }}</h5> -->

                    <p class="card-text" style="text-align: center;"><a>{{ businessUserName }}</a></p>

                    <div class="spdiv">
                        <span class="spaninfo">{{ openTime }}</span>
                        <span class="spaninfo" v-if="position">約 {{ distanceArray[index] }} km</span>
                        <span class="spaninfo"><font-awesome-icon :icon="['fas', 'star']" style="color: #FFD43B;" /> {{
                            rate }}</span>
                    </div>
                    <p>{{ address }}</p>
                </div>


            </div>
        </div>
    </div>
</template>
    
<script  setup>
import SearchComponent from '@/components/leon/SearchComponent.vue';
import LikeComponent from '@/components/leon/LikeComponent.vue';
import { getLocation } from './GetGeolocation';
import { reactive, ref } from 'vue';
import { useRouter } from 'vue-router';
import { get } from 'vue-cookies'
import axios from 'axios';

const lat = ref(window.sessionStorage.getItem("lat"));
const lon = ref(window.sessionStorage.getItem("lon"));
const latlonResponse = reactive([{}])
const distanceArray = reactive([])
const distance = ref();
const searchResult = ref([]);
const route = useRouter();
const position = ref(true)
window.onload = getLocation().then(bool => position.value = bool).catch(bool => position.value = bool);



function toOrderPage(id) {
    route.push({ name: 'OrderPage', params: { id: id } })
}
async function convertAddressToLatLng(address) {
    const responseData = await axios.get(`https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=`)
    console.log(responseData.data)
    return responseData.data;
}

async function startConvert() {
    for (let index = 0; index < searchResult.value.length; index++) {
        const response = await convertAddressToLatLng(searchResult.value[index].city + searchResult.value[index].dist + searchResult.value[index].address)
        if (response != null) {
            latlonResponse[index] = response.results[0].geometry.location
            distanceArray[index] = calDistance(lat.value, lon.value, latlonResponse[index].lat, latlonResponse[index].lng)
            console.log(response)
        }
    }
}



function calDistance(localLan, localLon, busLan, busLon) {
    if (localLan == busLan && localLon == busLon) {
        return 0;
    } else {

        var theta = localLon - busLon;
        var dist = 60 * 1.1515 * (180 / Math.PI) * Math.acos(
            Math.sin(localLan * (Math.PI / 180)) * Math.sin(busLan * (Math.PI / 180)) +
            Math.cos(localLan * (Math.PI / 180)) * Math.cos(busLan * (Math.PI / 180)) * Math.cos(theta * (Math.PI / 180))
        );
        distance.value = Math.round(dist * 1.609344 * 100) / 100;
        console.log(distance.value);
        return distance.value;
    }
}


function updateEvent(result) {
    searchResult.value = result.list;
    // console.log(searchResult.value[0]);
    // console.log("aabbcc = ", searchResult.value)
    startConvert()
}






</script>
    
















<style scoped>
.mouse {
    cursor: pointer;
}

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
