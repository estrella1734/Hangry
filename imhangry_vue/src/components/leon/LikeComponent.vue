<template>
    <button @click.stop="liked" @mouseover="mouseover" @mouseout="mouseout" :class="{ hover: isHover }">
        <font-awesome-icon :icon="['fas', 'heart']" style="color: grey; position: relative; top: 3px;" size="1x"
            v-if="likes" class="fonticon" />
        <font-awesome-icon :icon="['fas', 'heart']" style="color: rgb(243, 53, 85);position: relative; top: 3px;" size="1x"
            v-else class="fonticon" />
    </button>
</template>
    
<script setup>
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { get } from 'vue-cookies'
import { useRoute } from 'vue-router';
const likes = ref(false);
const isHover = ref(false);
const guestUserId = ref();
const busUserId = ref();
const route = useRoute();
const data = ref({})
const emit = defineEmits(["checkLikes"])
const props = defineProps({
    fk_business_id: Number,
})



function getcookie() {
    const cookieData = ref();
    cookieData.value = get('userData')
    cookieData.value = window.atob(cookieData.value)
    guestUserId.value = JSON.parse(cookieData.value).id
    busUserId.value = route.params.id
    if (busUserId.value == null) {
        busUserId.value = props.fk_business_id
    }
    data.value = { "fk_business_id": busUserId.value, "fk_guest_id": guestUserId.value }
    console.log(data.value)
}



async function liked() {
    if (likes.value == true) {
        likes.value = false
    } else {
        likes.value = true
    }
    const response = await axios.post(`${import.meta.env.VITE_API_BASE}/likes`, data.value);
    // console.log(response);

};
async function likeExist() {
    const response = await axios.post(`${import.meta.env.VITE_API_BASE}/likesExist`, data.value);
    console.log(response)
    likes.value = response.data;
    // console.log(likes.value)
}

onMounted(async () => {
    getcookie()
    likeExist();
})


function mouseover() {
    isHover.value = true
};
function mouseout() {
    isHover.value = false
};









</script>
    
<style scoped>
button {
    width: 47px;
    height: 47px;
    border-radius: 50% 50% 50% 50%;
    border: none;
    background-color: transparent;
}

.hover {
    background-color: rgb(179, 170, 170);
}
</style>