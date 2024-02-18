import { get } from 'vue-cookies'
import { reactive, ref } from 'vue';
import axios from 'axios';
const lat = ref(get('lat'));
const lon = ref(get('lon'));
const address = ref("");
const area = ref("");
const nearbyResult = ref([]);
const businessPosition = reactive([{}])
const distance = reactive([]);
const resultExist = ref(true)


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
            // getNearbyBusiness(area.value)
            console.log(address.value)
            console.log(area.value)
        } else {
            address.value = null;
        }
    } catch (error) {
        console.error('Error converting coordinates to address:', error);
    }
};

//以區域搜尋附近店家
async function getNearbyBusiness(dist) {
    const nearbyBusiness = await axios.get(`${import.meta.env.VITE_API_BASE}/SearchNearby/${dist}`)
    console.log(nearbyBusiness.data == "")
    if (nearbyBusiness.data == "") {
        resultExist.value = true
        console.log(resultExist.value)

    } else {
        nearbyResult.value = nearbyBusiness.data.list
        resultExist.value = false
        console.log(nearbyBusiness.data.list)
    }
}

// for (let index = 0; index < nearbyBusiness.data.list.length; index++) {
//     const addressToLocation = await convertAddressToLatLng(nearbyResult.value[index].city + nearbyResult.value[index].dist + nearbyResult.value[index].address)
// if (addressToLocation != null) {
//     businessPosition[index] = addressToLocation.results[0].geometry.location
//     distance[index] = calDistance(lat.value, lon.value, businessPosition[index].lat, businessPosition[index].lng)
//     console.log(distance[index])
// }
// }


//轉換商家地址->經緯度
async function convertAddressToLatLng(address) {
    const responseData = await axios.get(`https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=AIzaSyBDkuJCFNUhD_PlDN3Ptk-k5ZSS-0fvZug`)
    console.log("address->lat,lon = ", responseData.data)
    return responseData.data;
}

//計算兩個經緯度之間的距離
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




// console.log("dis = ", distance)
export { convertLatLngToAddress, calDistance, convertAddressToLatLng, getNearbyBusiness }

