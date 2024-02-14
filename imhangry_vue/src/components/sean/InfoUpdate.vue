<template>
    <div class="container">
        <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="card h-100 border-0">
                    <div class=" card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <!-- 照片修改-->
                                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        <img v-if="image" :src="'data:image/jpeg;base64,' + image"
                                            style="width: 200px; height: 200px; ">
                                        <img v-if="!image" src="/orderPageImage/Hangry.jpg"
                                            style="width: 200px; height: 200px; "></button>
                                    <p class="text-muted mt-2" style=" margin-left: 50px;">點擊照片進行修改</p>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog ">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">大頭貼修改</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <UpdateHeadShot :image="image" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 ">
                <div class="card h-100 border-0">
                    <div class="card-body">
                        <div class="row gutters ">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                <h3 class="mb-2 ">個人資訊修改</h3>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="name">姓名</label>
                                    <input type="text" class="form-control" id="name" v-model="name" required>
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="invoice">載具</label>
                                    <input type="text" class="form-control" id="invoice" v-model="invoice">
                                </div>
                            </div>

                        </div>

                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right">
                                    <RouterLink :to="{ path: `/LoginHome/${id}` }" tag="button" class="btn btn-secondary">
                                        Cancel</RouterLink>
                                    <button type="button" id="submit" name="submit" class="btn btn-primary"
                                        @click="handleUpdate">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
    
<script setup >
import UpdateHeadShot from '@/components/sean/UpdateHeadShot.vue';
import { ref, onMounted } from 'vue'
import axios from 'axios';
import { getCookieData } from '../sean/util/Gettes'
import Swal from 'sweetalert2';
import router from '@/router/router';
const isLoading = ref(true);
const userData = getCookieData('userData');
const id = userData?.id;
const image = ref('')
const name = ref('')
const invoice = ref('')

onMounted(async () => {
    if (!id) {
        console.log("no id");
        router.replace('/UserLogin');
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
        console.log("aaaaaaaaaaaaaa" + response)
        image.value = response.data.image;
        console.log("ccccccc" + response.data.image)

        console.log("bbbbbb" + image.value)
        name.value = response.data.name;
        invoice.value = response.data.invoice;

        console.log("old response.data=", response.data);
    } catch (error) {
        console.error("沒有讀到會員資訊:", error);
    } finally {
        setTimeout(() => {
            Swal.close();
            isLoading.value = false;
        }, 100);
    }

});
const handleUpdate = async (event) => {
    event.preventDefault();
    const updateData = {
        name: name.value,
        invoice: invoice.value,

    }
    console.log(updateData)
    const path = import.meta.env.VITE_API_GUESTUSERURL;
    const API_URL = `${path}/updateInfo/${id}`;
    try {
        const response = await axios.put(API_URL, updateData);
        const success = response.data.success;
        const message = response.data.message;
        if (success) {
            Swal.fire({
                title: '修改成功!',
                text: '跳轉回個人主頁',
                icon: 'success',
                showConfirmButton: false,
                allowOutsideClick: false,
                timer: 1500,
            }).then(() => {
                router.push(`/sean/LoginHome/${id}`);
            })
        } else {
            Swal.fire({
                title: '修改失敗',
                text: message,
                icon: 'error',
                allowOutsideClick: false,
            });
        }
    } catch (error) {
        console.log("error", error);
    }
};
</script>
    
<style scoped>
textarea {
    width: 100%;
    box-sizing: border-box;
    padding: 10px;
    resize: none;
}

.btn img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    /* 使圖片成為圓形 */
    object-fit: cover;
    /* 確保圖片填滿整個圓形區域 */
}

h3 {
    margin-bottom: 20px;
}

/* #exampleModal {
    width: 250px;

} */

.modal-dialog {
    width: 100%;
    max-width: 400px;
    /* 設定最大寬度 */
}
</style>