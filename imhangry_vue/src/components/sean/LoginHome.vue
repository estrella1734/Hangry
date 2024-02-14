
<template>
    <div v-if="!isLoading">
        <h3>Welcome, {{ name }}</h3>
    </div>
    <div v-else>
    </div>
</template>


<script setup >
import { ref, onMounted } from 'vue'
import axios from 'axios';
import Swal from 'sweetalert2';
import { getCookieData } from '../sean/util/Gettes'
import router from '@/router/router';

const userData = getCookieData('userData');
const id = userData?.id;
const name = ref('')

// const image = ref('')
// const invoice = ref('')
const isLoading = ref(true);
// const API_URL = `${path}/home/${id}`;
// const fetchData = async () => {
//     try {
//         const response = await axios.get(API_URL)
//         name.value = response.data.name;
//         image.value = response.data.image;
//         invoice.value = response.data.invoice;

//     } catch (error) {
//         console.error("Fail", error)
//     }
// }


onMounted(async () => {
    if (!id) {
        console.log("no Id");
        router.replace('/sean/UserLogin');
        return;
    }

    const path = import.meta.env.VITE_API_GUESTUSERURL;
    const API_URL = `${path}/home/${id}`;
    try {
        Swal.fire({
            title: "Loading...",
            showConfirmButton: false,
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            }
        })
        const response = await axios.get(API_URL);
        console.log("response", response.data)
        name.value = response.data.name;
    } catch (error) {
        console.error("沒有讀到會員資訊:", error);
    } finally {
        setTimeout(() => {
            Swal.close();
            isLoading.value = false;
        }, 500);
    }

});
</script>
    
<style></style>