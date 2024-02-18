<template>
    <div class="row row-cols-1 row-cols-md-3 g-4" style="margin-top:10px ; ">
        <div v-if="resultExist" style="text-align: center; width: 100%;">
            <div><font-awesome-icon :icon="['fas', 'question']" size="2xl" /></div>
            <div>
                <p style="font-size: 32px; font-family: 'Honk', system-ui; ">查無附近店家資料</p>
            </div>
        </div>
        <div class="col" v-for="{ address, businessUserName, icon, id, rate, openTime, dist, city, index } in nearbyResult"
            v-else>
            <RouterLink :to="{ path: '/OrderPage/', params: { id } }">
                <div class="card h-100" style="border: none; text-align: center;">

                    <img src="/orderPageImage/Hangry.jpg" class="card-img" alt=" " style="width: 100%; margin: auto;">
                    <LikeComponent style="position: absolute; top: 0; right: 0;" class="fonticon"></LikeComponent>
                    <div class="card-body">
                        <!-- <h5 class="card-title">{{spotId}} {{ spotTitle }}</h5> -->

                        <p class="card-text" style="text-align: center;"><a>{{ businessUserName }}</a></p>

                        <div class="spdiv">
                            <span class="spaninfo">{{ openTime }}</span>
                            <span class="spaninfo">約 {{ distance[index] }} km</span>
                            <span class="spaninfo"><font-awesome-icon :icon="['fas', 'star']" style="color: #FFD43B;" /> {{
                                rate }}</span>
                        </div>
                        <p>{{ city + dist + address }}</p>
                    </div>



                </div>
            </RouterLink>
        </div>
    </div>
</template>
    
<script setup>
import { onBeforeMount, onMounted, reactive, ref } from 'vue';
import axios from 'axios';
import LikeComponent from '@/components/leon/LikeComponent.vue';
import { get } from 'vue-cookies'
const lat = ref(window.sessionStorage.getItem("lat"));
const lon = ref(window.sessionStorage.getItem("lon"));
const address = ref("");
const area = ref("");
const nearbyResult = ref([]);
const businessPosition = reactive([{}])
const distance = reactive([]);
const resultExist = ref(true)


async function convertAddressToLatLng(address) {
    const responseData = await axios.get(`https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=`)
    // console.log(responseData.data)
    return responseData.data;
}




async function getNearbyBusiness(dist) {
    const nearbyBusiness = await axios.get(`${import.meta.env.VITE_API_BASE}/SearchNearby/${dist}`)
    console.log(nearbyBusiness.data == "")
    if (nearbyBusiness.data == "") {
        resultExist.value = true
        console.log(resultExist.value)

    } else {
        nearbyResult.value = nearbyBusiness.data.list
        resultExist.value = false
        console.log(resultExist.value)
        for (let index = 0; index < nearbyBusiness.data.list.length; index++) {
            const addressToLocation = await convertAddressToLatLng(nearbyResult.value[index].city + nearbyResult.value[index].dist + nearbyResult.value[index].address)
            // console.log("abcdefg", addressToLocation)
            if (addressToLocation != null) {
                // Object.assign(businessPosition[index], addressToLocation.results[0].geometry.location)
                businessPosition[index] = addressToLocation.results[0].geometry.location
                // console.log(businessPosition[index].lat)
                distance[index] = calDistance(lat.value, lon.value, businessPosition[index].lat, businessPosition[index].lng)
                console.log(distance[index])
                // getDistanceBetweenPoints(lat.value, lon.value, businessPosition[index].lat, businessPosition[index].lng)
            }
        }
    }

    // console.log(searchResult.value[index].city + searchResult.value[index].dist + searchResult.value[index].address)

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
onMounted(() => {
    convertLatLngToAddress();
})




// 將使用者自己的經緯度轉地址 取得地址、區名稱再取得附近是否有店家
async function convertLatLngToAddress() {
    try {

        console.log(lat.value, lon.value)
        const response = await axios.get(
            `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat.value},${lon.value}&key=`
        );

        if (response.data.results.length > 0) {
            const distnum = response.data.results[0].address_components.length
            address.value = response.data.results[0].formatted_address;
            area.value = response.data.results[0].address_components[distnum - 4].long_name
            getNearbyBusiness(area.value)
            console.log(address.value)
            //console.log(area.value)
            console.log(area.value)
        } else {
            address.value = null;
        }
    } catch (error) {
        console.error('Error converting coordinates to address:', error);
    }
};





</script>
    
<style></style>
